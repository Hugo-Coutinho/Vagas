//
//  HomeHeaderSection.swift
//  Vagas
//
//  Created by Hugo Coutinho on 15/02/21.
//  Copyright © 2021 Hugo Coutinho. All rights reserved.
//

import Foundation
import UIKit

// MARK: - VIEW CONTROLLER DELEGATE -
protocol HomeHeaderSectionOutput: SectionOutput {
    
}

final class HomeHeaderSection: Section {
    
    // MARK: - VARIABLES -
    var profile: HomeHeaderSectionDomain!
    
    // MARK: - CONSTRUCTORS -
    override init() {
        super.init()
        self.items = [NSObject()]
        self.profile = HomeHeaderSectionDomain()
    }
    
    // MARK: - INPUT METHODS -
    func startSection() {
        self.scene = .sceneSuccess
        self.output?.reloadSection(section: self, animation: .automatic)
    }
}

// MARK: - TABLEVIEW SECTION INPUT -
extension HomeHeaderSection: TableSectionCellInput {
    
    func didSelectCell(_ cell: UITableViewCell, at indexPath: IndexPath) {}
    
    func cell(for indexPath: IndexPath) -> UITableViewCell.Type {
        switch self.scene {
        case .sceneSuccess:
            return HomeHeaderSectionSuccessTableViewCell.self
        default:
            return HomeHeaderSectionSuccessTableViewCell.self
        }
    }
    
    func willDisplayCell(_ cell: UITableViewCell, at indexPath: IndexPath) {
        if let cell = cell as? HomeHeaderSectionSuccessTableViewCell {
            cell.delegate = self
            cell.setup(name: self.profile.name)
        }
    }
    
    func heightForRowInSection(indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: - SUCCESS CELL OUTPUT -
extension HomeHeaderSection: HomeHeaderSectionSuccessDelegate {
    
}
