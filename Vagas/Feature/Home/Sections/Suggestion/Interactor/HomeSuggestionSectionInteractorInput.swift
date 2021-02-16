//
//  HomeSuggestionSectionInteractorInput.swift
//  Vagas
//
//  Created by Hugo Coutinho on 16/02/21.
//  Copyright © 2021 Hugo Coutinho. All rights reserved.
//

import Foundation

// MARK: - INTERACTOR INPUT PROTOCOL -
protocol HomeSuggestionInteractorInput: class {
    
    // MARK: - VARIABLES -
    var output: HomeSuggestionInteractorOutput? { get set }
    var service: HomeSuggestionServiceInput { get set }
    
    // MARK: - INPUT METHODS -
    func getSuggestion()
}

// MARK: - INTERACTOR OUTPUT PROTOCOL -
protocol HomeSuggestionInteractorOutput: class {
    
    // MARK: - OUTPUT METHODS -
    func handleSuccess(suggestion: Suggestions)
    func removeSection()
}
