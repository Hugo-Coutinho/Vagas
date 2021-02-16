//
//  HomeSuggestionSectionServiceInput.swift
//  Vagas
//
//  Created by Hugo Coutinho on 16/02/21.
//  Copyright © 2021 Hugo Coutinho. All rights reserved.
//

import Foundation

// MARK: - SERVICE INPUT PROTOCOL -
protocol HomeSuggestionServiceInput: class {
    
    // MARK: - INPUT METHODS -
    func getSuggestion(token: String, suggestionHeader: String, completionHandler: @escaping (Data) -> Void)
}
