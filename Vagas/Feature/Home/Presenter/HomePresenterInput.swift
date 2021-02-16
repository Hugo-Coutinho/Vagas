//
//  PresenterInput.swift
//  Vagas
//
//  Created by Hugo Coutinho on 15/02/21.
//  Copyright © 2021 Hugo Coutinho. All rights reserved.
//

import Foundation

// MARK: - PRESENTER INPUT PROTOCOL -
protocol HomePresenterInput: class {
    
    // MARK: - VARIABLES -
    var output: HomePresenterOutput? { get set }
    var input: HomeInteractorInput? { get set }
    
    // MARK: - INPUT METHODS -
    func getKeys()
}

// MARK: - PRESENTER OUTPUT PROTOCOL -
protocol HomePresenterOutput: class {
    
    // MARK: - OUTPUT METHODS -
    func handleSuccess()
}

