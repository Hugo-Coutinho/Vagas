//
//  HomeHeaderSectionServiceInput.swift
//  Vagas
//
//  Created by Hugo Coutinho on 16/02/21.
//  Copyright © 2021 Hugo Coutinho. All rights reserved.
//

import Foundation

// MARK: - SERVICE INPUT PROTOCOL -
protocol HomeHeaderServiceInput: class {
    
    // MARK: - INPUT METHODS -
    func getProfile(authorization: String, completionHandler: @escaping (Data) -> Void)
}
