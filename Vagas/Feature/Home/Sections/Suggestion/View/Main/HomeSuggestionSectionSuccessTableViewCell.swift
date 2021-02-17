//
//  HomeSuggestionSectionSuccessTableViewCell.swift
//  Vagas
//
//  Created by Hugo Coutinho on 16/02/21.
//  Copyright © 2021 Hugo Coutinho. All rights reserved.
//

import UIKit

protocol HomeSuggestionSectionSuccessDelegate {
    
}

class HomeSuggestionSectionSuccessTableViewCell: UITableViewCell {
    
    // MARK: - OUTLETS -
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    // MARK: - VARIABLES -
    var delegate: HomeSuggestionSectionSuccessDelegate?
    private var suggestion: HomeSuggestionSectionDomain = HomeSuggestionSectionDomain()
    
    // MARK: - OVERRIDE -
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupCollectionView()
    }
    
    

    // MARK: - SETUP -
    func setup(suggestion: HomeSuggestionSectionDomain) {
        self.pageControl.numberOfPages = suggestion.suggestions.count
        self.suggestion = suggestion
    }
}

// MARK: - AUX METHODS -
extension HomeSuggestionSectionSuccessTableViewCell {
    private func registerCell() {
        self.collectionView.register(HomeSuggestionSectionSuccessCollectionViewCell.self)
    }
    
    private func setupCollectionView() {
        self.registerCell()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.isPagingEnabled = true
        self.collectionView.isScrollEnabled = true
    }
}

//MARK: - UICOLLECTIONVIEW DATASOURCE -
extension HomeSuggestionSectionSuccessTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.suggestion.suggestions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: HomeSuggestionSectionSuccessCollectionViewCell = self.collectionView.dequeueReusableCell(for: indexPath)
        let item = self.suggestion.suggestions[indexPath.row]
        cell.row = indexPath.row
        cell.setup(suggestion: item, output: self)
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSet = scrollView.contentOffset.x
        let width = scrollView.frame.width
        let horizontalCenter = width / 2
        
        self.pageControl.currentPage = Int(offSet + horizontalCenter) / Int(width)
    }
}

//MARK: - COLLECTION VIEW DELEGATE FLOW LAYOUT -
extension HomeSuggestionSectionSuccessTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width, height: CGFloat(178))
    }
}


//MARK: - COLLECTION VIEW OUTPUT -
extension HomeSuggestionSectionSuccessTableViewCell: HomeSuggestionSectionSuccessCollectionOutput {
    func didTapSendCV(row: Int) {
        self.suggestion.suggestions[row].buttonTitle = Constant.View.userDidSendCVButtonTitle
    }
}
