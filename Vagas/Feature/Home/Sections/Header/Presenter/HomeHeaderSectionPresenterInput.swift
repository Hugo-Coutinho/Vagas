//
//  HomeHeaderSectionPresenterInput.swift
//  Vagas
//
//  Created by Hugo Coutinho on 15/02/21.
//  Copyright © 2021 Hugo Coutinho. All rights reserved.
//

import Foundation

// MARK: - PRESENTER INPUT PROTOCOL -
protocol HomeHeaderSectionPresenterInput: class {
    
    // MARK: - VARIABLES -
    var output: HomeHeaderSectionPresenterOutput? { get set }
    var input: HomeHeaderInteractorInput? { get set }
    
    // MARK: - INPUT METHODS -
    func getProfile()
}

// MARK: - PRESENTER OUTPUT PROTOCOL -
protocol HomeHeaderSectionPresenterOutput: class {
    
    // MARK: - OUTPUT METHODS -
    func handleSuccess(profile: HomeHeaderSectionDomain)
}

