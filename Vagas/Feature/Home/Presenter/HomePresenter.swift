//
//  HomePresenter.swift
//  Vagas
//
//  Created by Hugo Coutinho on 16/02/21.
//  Copyright © 2021 Hugo Coutinho. All rights reserved.
//

import Foundation

class HomePresenter: HomePresenterInput {
    
    // MARK: - VARIABLES -
    var output: HomePresenterOutput?
    var input: HomeInteractorInput?
    
    // MARK: - CONSTRUCTORS -
    init(input: HomeInteractorInput, output: HomePresenterOutput) {
        self.input = input
        self.output = output
    }
    
    // MARK: - INPUT -
    func getStarted() {
        self.input?.getStarted()
    }
}

// MARK: - INTERACTOR OUTPUT -
extension HomePresenter: HomeInteractorOutput {
    func handleSuccess(profile: ProfileEntity) {
        self.output?.handleSuccess(profile: HomeHeaderSectionDomain(profile: profile))
    }
}
