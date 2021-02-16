//
//  HomeSuggestionSectionPresenter.swift
//  Vagas
//
//  Created by Hugo Coutinho on 16/02/21.
//  Copyright © 2021 Hugo Coutinho. All rights reserved.
//

import Foundation

class HomeSuggestionSectionPresenter: HomeSuggestionSectionPresenterInput {
    
    // MARK: - VARIABLES -
    var output: HomeSuggestionSectionPresenterOutput?
    var input: HomeSuggestionInteractorInput?
    
    // MARK: - CONSTRUCTORS -
    init(input: HomeSuggestionInteractorInput, output: HomeSuggestionSectionPresenterOutput) {
        self.input = input
        self.output = output
    }
    
    // MARK: - INPUT -
    func getSuggestion() {
        self.input?.getSuggestion()
    }
}

// MARK: - INTERACTOR OUTPUT -
extension HomeSuggestionSectionPresenter: HomeSuggestionInteractorOutput {
    func handleSuccess(suggestion: Suggestions) {
        self.output?.handleSuccess(suggestion: HomeSuggestionSectionDomain(suggestion: suggestion))
    }
    
    func removeSection() {
        self.output?.removeSection()
    }
}
