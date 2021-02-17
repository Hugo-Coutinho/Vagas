//
//  HomeTipsSectionPresenterInput.swift
//  Vagas
//
//  Created by Hugo Coutinho on 16/02/21.
//  Copyright © 2021 Hugo Coutinho. All rights reserved.
//

import Foundation

// MARK: - PRESENTER INPUT PROTOCOL -
protocol HomeTipsSectionPresenterInput: class {
    
    // MARK: - VARIABLES -
    var output: HomeTipsSectionPresenterOutput? { get set }
    var input: HomeTipsInteractorInput? { get set }
    
    // MARK: - INPUT METHODS -
    func getTips()
    func didTapTipPreference(type: TipActionEnum)
}

// MARK: - PRESENTER OUTPUT PROTOCOL -
protocol HomeTipsSectionPresenterOutput: class {
    
    // MARK: - OUTPUT METHODS -
    func handleSuccess(tips: HomeTipsSectionDomain)
    func removeSection()
}


