//
//  TableViewController.swift
//  Vagas
//
//  Created by Hugo Coutinho on 15/02/21.
//  Copyright © 2021 Hugo Coutinho. All rights reserved.
//

import UIKit

//MARK: - Life Cycle
public class TableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var sections: [Section] = []
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.setupSectionsOutput()
        sections.forEach({($0 as? SectionStateInput)?.viewDidLoad?()})
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        sections.forEach({ ($0 as? SectionStateInput)?.viewWillAppear?() })
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sections.forEach({ ($0 as? SectionStateInput)?.viewWillDisappear?() })
    }
    
    private func setupSectionsOutput() {
        sections.forEach({ $0.output = self })
    }
    
    private func registerCell(_ section: Section, at indexPath: IndexPath) {
        let cellClass = (section as? TableSectionCellInput)?.cell(for: indexPath) ?? UITableViewCell.self
        let nib = UINib(nibName: cellClass.defaultReuseIdentifier, bundle: Bundle(for:cellClass.self))
        self.tableView.register(nib, forCellReuseIdentifier: cellClass.defaultReuseIdentifier)
    }
    
    private func registerHeader(_ section: Section) {
        guard let header = (section as? TableSectionHeaderInput)?.header() else { return }
        let nib = UINib(nibName: header.defaultReuseIdentifier, bundle: Bundle(for:header.self))
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: header.defaultReuseIdentifier)
    }
}

//MARK: - UITableViewDelegate
extension TableViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else {return}
        (sections[indexPath.section] as? TableSectionCellInput)?.didSelectCell(cell, at: indexPath)
    }
}

//MARK: - UITableViewDataSource
extension TableViewController: UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  (self.sections[section]).items.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = sections[indexPath.section]
        
        let identifier = (section as? TableSectionCellInput)?.cell(for: indexPath).defaultReuseIdentifier ?? UITableViewCell.defaultReuseIdentifier
        
        registerCell(section, at: indexPath)
        
        let cell = tableView.dequeueReusableCell(withIdentifier:identifier, for:indexPath)
        
        cell.clipsToBounds = true
        
        (section as? TableSectionCellInput)?.willDisplayCell(cell, at: indexPath)
        
        return cell
    }
    
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        guard let height = (sections[indexPath.section] as? TableSectionCellInput)?.heightForRowInSection?(indexPath: indexPath) else {
            return UITableView.automaticDimension
        }
        return height
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat { return UITableView.automaticDimension }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let section = sections[section]
        registerHeader(section)
        
        guard let sectionHeader = section as? TableSectionHeaderInput, sectionHeader.shouldDisplayHeader(),
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: sectionHeader.header().defaultReuseIdentifier) else
        { return UIView(frame: CGRect.zero) }
        
        header.prepareForReuse()
        
        return header
    }
    
    public func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let section = sections[section]
        guard let sectionHeader = section as? TableSectionHeaderInput, sectionHeader.shouldDisplayHeader() else { return }
        sectionHeader.willDisplayHeader?(view)
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard let height = (sections[section] as? TableSectionHeaderInput)?.heightForHeaderInSection?() else { return .leastNonzeroMagnitude }
        return height
    }
}


//MARK: - SectionOutput
extension TableViewController: SectionOutput {
    
    func setSelectedCell(from index: Int, in section: Section, animated:Bool, scrollPosition:UITableView.ScrollPosition) {
        executeOnMainQueue {
            guard let indexOfSection = self.sections.index(of:section) else { return }
            self.tableView.selectRow(at: IndexPath.init(row:index, section: indexOfSection), animated: animated, scrollPosition: scrollPosition)
        }
    }
    
    func removeItem(from index: Int, in section: Section, animation:UITableView.RowAnimation, completion: (() -> Void)?) {
        self.runPerformBatchUpdates({
            self.remove(from:index, in:section, with:animation)
        }, completion: {
            completion?()
        })
    }
    
    func endRefreshing(error: String?) {  }
    
    func reloadSection(section: Section, animation:UITableView.RowAnimation) {
        self.reload(with: section, and: animation)
    }
}

//MARK: - Helpers
extension TableViewController {
    
    private func runPerformBatchUpdates(_ block: @escaping ()->(), completion:@escaping ()->Void) {
        
        executeOnMainQueue {
            
            if #available(iOS 11.0, *) {
                
                self.tableView.performBatchUpdates({
                    
                    block()
                    
                }, completion: { (_) in
                    
                    completion()
                    
                })
                
            } else {
                
                CATransaction.begin()
                
                self.tableView.beginUpdates()
                
                CATransaction.setCompletionBlock { () -> Void in
                    
                    completion()
                }
                
                block()
                
                self.tableView.endUpdates()
                
                CATransaction.commit()
            }
        }
    }
    
    private func remove(from index: Int, in section:Section, with animation:UITableView.RowAnimation) {
        
        if let sectionIndex = self.sections.index(of:section), section.items.count > index {
            section.items.remove(at:index)
            let changed = [IndexPath.init(item:index, section:sectionIndex)]
            self.tableView.deleteRows(at:changed, with:animation)
        }
    }
    
    private func reload(with section:Section, and animation:UITableView.RowAnimation) {
        
        guard let sectionIndex = self.sections.lastIndex(of:section) else {
            return
        }
        
        self.tableView.reloadSections(IndexSet.init(integer:sectionIndex), with: animation)
        self.reloadWithoutAnimation()
    }
    
    private func reloadWithoutAnimation() {
        let lastScrollOffset = self.tableView.contentOffset
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
        self.tableView.layer.removeAllAnimations()
        self.tableView.setContentOffset(lastScrollOffset, animated: false)
    }
}





