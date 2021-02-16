//
//  HomeSuggestionSection.swift
//  Vagas
//
//  Created by Hugo Coutinho on 16/02/21.
//  Copyright © 2021 Hugo Coutinho. All rights reserved.
//

import Foundation
import UIKit

protocol HomeSuggestionSectionOutput: SectionOutput {
    
}

final class HomeSuggestionSection: Section {
    
    // MARK: - VARIABLES -
    var presenter: HomeSuggestionSectionPresenterInput?
    private var suggestion: HomeSuggestionSectionDomain!
    
    // MARK: - CONSTRUCTORS -
    override init() {
        super.init()
        self.items = [NSObject()]
        self.suggestion = HomeSuggestionSectionDomain()
    }
    
    // MARK: - INPUT METHODS -
    func startSection() {
        presenter?.getSuggestion()
    }
}

// MARK: - TABLEVIEW SECTION INPUT -
extension HomeSuggestionSection: TableSectionCellInput {
    
    func didSelectCell(_ cell: UITableViewCell, at indexPath: IndexPath) {}
    
    func cell(for indexPath: IndexPath) -> UITableViewCell.Type {
        switch self.scene {
        case .sceneSuccess:
            return HomeSuggestionSectionSuccessTableViewCell.self
        default:
            return HomeSuggestionSectionSuccessTableViewCell.self
        }
    }
    
    func willDisplayCell(_ cell: UITableViewCell, at indexPath: IndexPath) {
        guard let cell = cell as? HomeSuggestionSectionSuccessTableViewCell,
            self.suggestion.suggestions.count > 0 else { return }
        cell.delegate = self
        cell.setup(suggestion: self.suggestion)
        
    }
    
    func heightForRowInSection(indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: - PRESENTER OUTPUT -
extension HomeSuggestionSection : HomeSuggestionSectionPresenterOutput {
    func handleSuccess(suggestion: HomeSuggestionSectionDomain) {
        self.scene = .sceneSuccess
        self.suggestion = suggestion
        self.items = [suggestion.suggestions]
        self.output?.reloadSection(section: self, animation: .automatic)
    }
    
    func removeSection() {
        self.output?.removeItem(from: 0, in: self, animation: .fade, completion: nil)
    }
}


// MARK: - SUCCESS CELL OUTPUT -
extension HomeSuggestionSection: HomeSuggestionSectionSuccessDelegate {
    
}

