//
//  InteractorInput.swift
//  Vagas
//
//  Created by Hugo Coutinho on 15/02/21.
//  Copyright © 2021 Hugo Coutinho. All rights reserved.
//

import Foundation

// MARK: - INTERACTOR INPUT PROTOCOL -
protocol HomeInteractorInput: class {
    
    // MARK: - VARIABLES -
    var output: HomeInteractorOutput? { get set }
    var service: HomeServiceInput { get set }
    
    // MARK: - INPUT METHODS -
    func getStarted()
}

// MARK: - INTERACTOR OUTPUT PROTOCOL -
protocol HomeInteractorOutput: class {
    
    // MARK: - OUTPUT METHODS -
    func handleSuccess(profile: ProfileEntity)
}
