//
//  HomeTipsSectionPresenter.swift
//  Vagas
//
//  Created by Hugo Coutinho on 16/02/21.
//  Copyright © 2021 Hugo Coutinho. All rights reserved.
//

import Foundation

class HomeTipsSectionPresenter: HomeTipsSectionPresenterInput {
    
    // MARK: - VARIABLES -
    var output: HomeTipsSectionPresenterOutput?
    var input: HomeTipsInteractorInput?
    
    // MARK: - CONSTRUCTORS -
    init(input: HomeTipsInteractorInput, output: HomeTipsSectionPresenterOutput) {
        self.input = input
        self.output = output
    }
    
    // MARK: - INPUT -
    func getTips() {
        self.input?.getTips()
    }
}

// MARK: - INTERACTOR OUTPUT -
extension HomeTipsSectionPresenter: HomeTipsInteractorOutput {
    func handleSuccess(tips: Tips) {
        self.output?.handleSuccess(tips: HomeTipsSectionDomain(tips: tips))
    }
    
    func removeSection() {
        self.output?.removeSection()
    }
}
