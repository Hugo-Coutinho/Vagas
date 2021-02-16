//
//  HomeSuggestionSectionInteractor.swift
//  Vagas
//
//  Created by Hugo Coutinho on 16/02/21.
//  Copyright © 2021 Hugo Coutinho. All rights reserved.
//

import Foundation

class HomeSuggestionInteractor: HomeSuggestionInteractorInput {
    
    // MARK: - VARIABLES -
    var output: HomeSuggestionInteractorOutput?
    var service: HomeSuggestionServiceInput
    
    // MARK: - CONSTRUCTOR -
    init(service: HomeSuggestionServiceInput) {
        self.service = service
    }
    
    // MARK: - INPUT METHODS -
    func getSuggestion() {
        guard let suggestion: String = UserDefaultsHelper.getValueForKey(.suggestion),
            let token = UserDefaultsHelper.getValueForKey(.token) else { return }
        self.service.getSuggestion(token: token, suggestionHeader: suggestion) { (data) in
            do {
                let suggestion = try JSONDecoder().decode(Suggestions.self, from: data)
                self.handleOutput(suggestion: suggestion)
            } catch {
                print("error scene")
            }
        }
    }
}

// MARK: - AUX METHODS -
extension HomeSuggestionInteractor {
    private func handleOutput(suggestion: Suggestions) {
        guard suggestion.count > 0 else { self.output?.removeSection(); return }
        self.output?.handleSuccess(suggestion: suggestion)
    }
}
