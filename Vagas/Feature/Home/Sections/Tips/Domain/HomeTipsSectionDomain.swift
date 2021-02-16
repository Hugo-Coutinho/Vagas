//
//  HomeTipsSectionDomain.swift
//  Vagas
//
//  Created by Hugo Coutinho on 16/02/21.
//  Copyright © 2021 Hugo Coutinho. All rights reserved.
//

import Foundation

struct HomeTipsSectionDomain {
    var tips: [TipsItemDomain] = []
    
    init() {}
    
    init(tips: Tips) {
        self.tips = self.mapTips(tips: tips)
    }
}

// MARK: - AUX METHODS -
extension HomeTipsSectionDomain {
    private func mapTips(tips: Tips) -> [TipsItemDomain] {
        return tips.compactMap({ (current) -> TipsItemDomain? in
            guard let description = current.description,
                let button = current.button,
                let isShowButton = button.show,
                let url = button.url,
                let buttonTitle = button.label else { return nil }
            return TipsItemDomain(description: description, buttonTitle: buttonTitle, url: url, isShowButton: isShowButton)
        })
    }
}

// MARK: - TIPS ITEM -
struct TipsItemDomain {
    let description, buttonTitle, url: String
    let isShowButton: Bool
}
