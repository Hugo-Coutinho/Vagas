//
//  HomeServiceInput.swift
//  Vagas
//
//  Created by Hugo Coutinho on 15/02/21.
//  Copyright © 2021 Hugo Coutinho. All rights reserved.
//

import Foundation

// MARK: - SERVICE INPUT PROTOCOL -
protocol HomeServiceInput: class {
    
    // MARK: - INPUT METHODS -
    func getKeys(completionHandler: @escaping (Data) -> Void)
}
