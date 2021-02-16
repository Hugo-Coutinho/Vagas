//
//  HomeHeaderSectionBuilder.swift
//  Vagas
//
//  Created by Hugo Coutinho on 15/02/21.
//  Copyright © 2021 Hugo Coutinho. All rights reserved.
//

import Foundation
import UIKit

final class HomeHeaderSectionBuilder {
    
    // MARK: - CONSTRUCTOR -
    init(){}
    
    // MARK: - PRESENTER BUILDER -
    func makePresenter(headerSection: HomeHeaderSection) -> HomeHeaderSectionPresenter {
        let service: HomeHeaderServiceInput = HomeHeaderService()
        let interactor: HomeHeaderInteractorInput = HomeHeaderInteractor(service: service)
        let presenter = HomeHeaderSectionPresenter(input: interactor, output: headerSection)
        interactor.output = presenter
        return presenter
    }
    
    func make(output: HomeHeaderSectionOutput) -> HomeHeaderSection {
        let section = HomeHeaderSection()
        let presenter = self.makePresenter(headerSection: section)
        section.presenter = presenter
        section.output = output
        section.startSection()
        return section
    }
}
