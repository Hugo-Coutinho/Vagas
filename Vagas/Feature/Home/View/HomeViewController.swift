//
//  ViewController.swift
//  Vagas
//
//  Created by Hugo Coutinho on 15/02/21.
//  Copyright © 2021 Hugo Coutinho. All rights reserved.
//

import UIKit

class HomeViewController: TableViewController {

    // MARK: - VARIABLES -
    private var presenter: HomePresenterInput!
    
    // MARK: - LIFE CYCLE -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = HomeBuilder().make(viewController: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.presenter.getStarted()
    }
}

// MARK: - HEADER SECTION OUTPUT -
extension HomeViewController: HomePresenterOutput {
    func handleSuccess(profile: HomeHeaderSectionDomain) {
        self.sections = [
            HomeHeaderSectionBuilder().make(profile: profile, output: self),
            HomeSuggestionSectionBuilder().make(output: self),
            HomeTipsSectionBuilder().make(output: self),
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


// MARK: - TIPS SECTION OUTPUT -
extension HomeViewController: HomeTipsSectionOutput {
    
}

