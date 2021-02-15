//
//  KeyEntity.swift
//  Vagas
//
//  Created by Hugo Coutinho on 15/02/21.
//  Copyright © 2021 Hugo Coutinho. All rights reserved.
//

import Foundation

// MARK: - Welcome
struct KeyEntity: Codable {
    let auth, tips, suggestion, survey: String?
}
