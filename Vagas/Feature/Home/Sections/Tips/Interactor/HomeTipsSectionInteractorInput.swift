//
//  HomeTipsSectionInteractorInput.swift
//  Vagas
//
//  Created by Hugo Coutinho on 16/02/21.
//  Copyright © 2021 Hugo Coutinho. All rights reserved.
//

import Foundation

// MARK: - INTERACTOR INPUT PROTOCOL -
protocol HomeTipsInteractorInput: class {
    
    // MARK: - VARIABLES -
    var output: HomeTipsInteractorOutput? { get set }
    var service: HomeTipsServiceInput { get set }
    
    // MARK: - INPUT METHODS -
    func getTips()
    func didTapTipPreference(action: TipActionEnum, tipId: String)
}

// MARK: - INTERACTOR OUTPUT PROTOCOL -
protocol HomeTipsInteractorOutput: class {
    
    // MARK: - OUTPUT METHODS -
    func handleSuccess(tips: Tips)
    func removeSection()
}
