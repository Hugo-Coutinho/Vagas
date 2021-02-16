//
//  HomeSuggestionSectionBuilder.swift
//  Vagas
//
//  Created by Hugo Coutinho on 16/02/21.
//  Copyright © 2021 Hugo Coutinho. All rights reserved.
//

import Foundation

final class HomeSuggestionSectionBuilder {
    
    // MARK: - CONSTRUCTOR -
    init(){}
    
    // MARK: - PRESENTER BUILDER -
    func makePresenter(section: HomeSuggestionSection) -> HomeSuggestionSectionPresenter {
        let service: HomeSuggestionServiceInput = HomeSuggestionService()
        let interactor: HomeSuggestionInteractorInput = HomeSuggestionInteractor(service: service)
        let presenter = HomeSuggestionSectionPresenter(input: interactor, output: section)
        interactor.output = presenter
        return presenter
    }
    
    func make(output: HomeSuggestionSectionOutput) -> HomeSuggestionSection {
        let section = HomeSuggestionSection()
        let presenter = self.makePresenter(section: section)
        section.presenter = presenter
        section.output = output
        section.startSection()
        return section
    }
}
