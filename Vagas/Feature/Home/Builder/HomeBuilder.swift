//
//  HomeBuilder.swift
//  Vagas
//
//  Created by Hugo Coutinho on 16/02/21.
//  Copyright © 2021 Hugo Coutinho. All rights reserved.
//

import Foundation
import UIKit

final class HomeBuilder {
    
    // MARK: - CONSTRUCTOR -
    init(){}
    
    // MARK: - PRESENTER BUILDER -
    func make(viewController: HomeViewController) -> HomePresenterInput {
        let service: HomeServiceInput = HomeService()
        let interactor: HomeInteractorInput = HomeInteractor(service: service)
        let presenter = HomePresenter(input: interactor, output: viewController)
        interactor.output = presenter
        return presenter
    }
}


