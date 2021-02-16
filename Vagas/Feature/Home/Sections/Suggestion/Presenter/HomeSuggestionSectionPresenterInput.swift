//
//  HomeSuggestionSectionPresenterInput.swift
//  Vagas
//
//  Created by Hugo Coutinho on 16/02/21.
//  Copyright © 2021 Hugo Coutinho. All rights reserved.
//

import Foundation

// MARK: - PRESENTER INPUT PROTOCOL -
protocol HomeSuggestionSectionPresenterInput: class {
    
    // MARK: - VARIABLES -
    var output: HomeSuggestionSectionPresenterOutput? { get set }
    var input: HomeSuggestionInteractorInput? { get set }
    
    // MARK: - INPUT METHODS -
    func getSuggestion()
}

// MARK: - PRESENTER OUTPUT PROTOCOL -
protocol HomeSuggestionSectionPresenterOutput: class {
    
    // MARK: - OUTPUT METHODS -
    func handleSuccess(suggestion: HomeSuggestionSectionDomain)
    func removeSection()
}

