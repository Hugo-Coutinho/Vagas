//
//  HomeTipsSectionServiceInput.swift
//  Vagas
//
//  Created by Hugo Coutinho on 16/02/21.
//  Copyright © 2021 Hugo Coutinho. All rights reserved.
//

import Foundation

// MARK: - SERVICE INPUT PROTOCOL -
protocol HomeTipsServiceInput: class {
    
    // MARK: - INPUT METHODS -
    func getTips(tipsHeader: String, completionHandler: @escaping (Data) -> Void)
}

