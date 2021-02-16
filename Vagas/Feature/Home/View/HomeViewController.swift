//
//  ViewController.swift
//  Vagas
//
//  Created by Hugo Coutinho on 15/02/21.
//  Copyright © 2021 Hugo Coutinho. All rights reserved.
//

import UIKit

class HomeViewController: TableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let service: HomeServiceInput = HomeService()
        let interactor: HomeInteractorInput = HomeInteractor(service: service)
        interactor.getKeys()
//        interactor.getProfile()
//        interactor.getSuggestion()
//        interactor.getTips()
        self.sections = [
            HomeHeaderSectionBuilder().make(output: self),
            HomeSuggestionSectionBuilder().make(output: self),
        ]
        self.tableView.reloadData()
    }
}

// MARK: - HEADER SECTION OUTPUT -
extension HomeViewController: HomeHeaderSectionOutput {
    
}


// MARK: - SUGGESTION SECTION OUTPUT -
extension HomeViewController: HomeSuggestionSectionOutput {
    
}

