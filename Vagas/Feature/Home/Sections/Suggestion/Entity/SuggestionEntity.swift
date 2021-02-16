//
//  SuggestionEntity.swift
//  Vagas
//
//  Created by Hugo Coutinho on 15/02/21.
//  Copyright © 2021 Hugo Coutinho. All rights reserved.
//

import Foundation

struct SuggestionEntity: Codable {
    let jobAdTile, company, date: String?
    let totalPositions: Int?
    let locations: [String]?
    let salary: Salary?
}

// MARK: - Salary
struct Salary: Codable {
    let real, range: String?
}

typealias Suggestions = [SuggestionEntity]
