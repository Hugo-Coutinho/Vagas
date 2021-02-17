//
//  HomeTipsSection.swift
//  Vagas
//
//  Created by Hugo Coutinho on 16/02/21.
//  Copyright © 2021 Hugo Coutinho. All rights reserved.
//

import Foundation
import UIKit

// MARK: - VIEW CONTROLLER DELEGATE -
protocol HomeTipsSectionOutput: SectionOutput {
    
}

final class HomeTipsSection: Section {
    
    // MARK: - VARIABLES -
    var presenter: HomeTipsSectionPresenterInput?
    private var tips: HomeTipsSectionDomain!
    
    // MARK: - CONSTRUCTORS -
    override init() {
        super.init()
        self.items = [NSObject()]
        self.tips = HomeTipsSectionDomain()
    }
    
    // MARK: - INPUT METHODS -
    func startSection() {
        presenter?.getTips()
    }
}

// MARK: - TABLEVIEW SECTION INPUT -
extension HomeTipsSection: TableSectionCellInput {
    
    func didSelectCell(_ cell: UITableViewCell, at indexPath: IndexPath) {}
    
    func cell(for indexPath: IndexPath) -> UITableViewCell.Type {
        switch self.scene {
        case .sceneSuccess:
            return HomeTipsSectionSuccessTableViewCell.self
        default:
            return HomeTipsSectionSuccessTableViewCell.self
        }
    }
    
    func willDisplayCell(_ cell: UITableViewCell, at indexPath: IndexPath) {
        guard let cell = cell as? HomeTipsSectionSuccessTableViewCell,
            self.tips.tips.count > 0,
        let firstTip = self.tips.tips.first else { return }
        cell.delegate = self
        cell.setup(tips: firstTip)
        
    }
    
    func heightForRowInSection(indexPath: IndexPath) -> CGFloat {
        return CGFloat(400)
    }
}

// MARK: - PRESENTER OUTPUT -
extension HomeTipsSection : HomeTipsSectionPresenterOutput {
    func handleSuccess(tips: HomeTipsSectionDomain) {
        self.scene = .sceneSuccess
        self.tips = tips
        self.items = [tips.tips]
        self.output?.reloadSection(section: self, animation: .automatic)
    }
    
    func removeSection() {
        self.output?.removeItem(from: 0, in: self, animation: .fade, completion: nil)
    }
}


// MARK: - SUCCESS CELL OUTPUT -
extension HomeTipsSection: HomeTipsSectionSuccessDelegate {
    func didTapTipPreference(type: TipActionEnum) {
        self.presenter?.didTapTipPreference(type: type)
    }
}

