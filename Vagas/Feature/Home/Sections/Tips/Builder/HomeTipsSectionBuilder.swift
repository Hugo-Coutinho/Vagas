//
//  HomeTipsSectionBuilder.swift
//  Vagas
//
//  Created by Hugo Coutinho on 16/02/21.
//  Copyright © 2021 Hugo Coutinho. All rights reserved.
//

import Foundation


final class HomeTipsSectionBuilder {
    
    // MARK: - CONSTRUCTOR -
    init(){}
    
    // MARK: - PRESENTER BUILDER -
    func makePresenter(section: HomeTipsSection) -> HomeTipsSectionPresenter {
        let service: HomeTipsServiceInput = HomeTipsService()
        let interactor: HomeTipsInteractorInput = HomeTipsInteractor(service: service)
        let presenter = HomeTipsSectionPresenter(input: interactor, output: section)
        interactor.output = presenter
        return presenter
    }
    
    func make(output: HomeTipsSectionOutput) -> HomeTipsSection {
        let section = HomeTipsSection()
        let presenter = self.makePresenter(section: section)
        section.presenter = presenter
        section.output = output
        section.startSection()
        return section
    }
}
