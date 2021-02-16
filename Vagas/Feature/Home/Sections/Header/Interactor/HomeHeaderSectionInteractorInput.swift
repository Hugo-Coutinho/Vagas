//
//  HeaderSectionInteractorInput.swift
//  Vagas
//
//  Created by Hugo Coutinho on 16/02/21.
//  Copyright © 2021 Hugo Coutinho. All rights reserved.
//

import Foundation

// MARK: - INTERACTOR INPUT PROTOCOL -
protocol HomeHeaderInteractorInput: class {
    
    // MARK: - VARIABLES -
    var output: HomeHeaderInteractorOutput? { get set }
    var service: HomeHeaderServiceInput { get set }
    
    // MARK: - INPUT METHODS -
    func getProfile()
}

// MARK: - INTERACTOR OUTPUT PROTOCOL -
protocol HomeHeaderInteractorOutput: class {
    
    // MARK: - OUTPUT METHODS -
    func handleSuccess(profile: ProfileEntity)
}
