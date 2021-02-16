//
//  HomeHeaderSectionPresenter.swift
//  Vagas
//
//  Created by Hugo Coutinho on 15/02/21.
//  Copyright © 2021 Hugo Coutinho. All rights reserved.
//

import Foundation

class HomeHeaderSectionPresenter: HomeHeaderSectionPresenterInput {
    
    // MARK: - VARIABLES -
    var output: HomeHeaderSectionPresenterOutput?
    var input: HomeHeaderInteractorInput?
    
    // MARK: - CONSTRUCTORS -
    init(input: HomeHeaderInteractorInput, output: HomeHeaderSectionPresenterOutput) {
        self.input = input
        self.output = output
    }
    
    // MARK: - INPUT -
    func getProfile() {
        self.input?.getProfile()
    }
}

// MARK: - INTERACTOR OUTPUT -
extension HomeHeaderSectionPresenter: HomeHeaderInteractorOutput {
    func handleSuccess(profile: ProfileEntity) {
        self.output?.handleSuccess(profile: HomeHeaderSectionDomain(profile: profile))
    }
}
