//
//  TipsEntity.swift
//  Vagas
//
//  Created by Hugo Coutinho on 15/02/21.
//  Copyright © 2021 Hugo Coutinho. All rights reserved.
//

import Foundation

// MARK: - Tips
struct TipsEntity: Codable {
    let id, welcomeDescription: String?
    let button: Button?

    enum CodingKeys: String, CodingKey {
        case id
        case welcomeDescription = "description"
        case button
    }
}

// MARK: - Button
struct Button: Codable {
    let show: Bool?
    let label: String?
    let url: String?
}

typealias Tips = [TipsEntity]
