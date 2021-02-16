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
    func getKeys() {
        guard let _: String = UserDefaultsHelper.getValueForKey(.auth) else { self.input?.getKeys(); return }
        self.output?.handleSuccess()
    }
}

// MARK: - INTERACTOR OUTPUT -
extension HomePresenter: HomeInteractorOutput {
    func handleSuccess() {
        self.output?.handleSuccess()
    }
}
