//
//  HomeSuggestionSectionDomain.swift
//  Vagas
//
//  Created by Hugo Coutinho on 16/02/21.
//  Copyright © 2021 Hugo Coutinho. All rights reserved.
//

import Foundation

struct HomeSuggestionSectionDomain {
    var suggestions: [SuggestionItemDomain] = []
    
    init() {}
    
    init(suggestion: Suggestions) {
        self.suggestions = self.mapSuggestions(suggestion: suggestion)
    }
}

// MARK: - AUX METHODS -
extension HomeSuggestionSectionDomain {
    private func mapSuggestions(suggestion: Suggestions) -> [SuggestionItemDomain] {
        return suggestion.compactMap({ (current) -> SuggestionItemDomain? in
            guard let title = current.jobAdTile,
                let companyTitle = current.company,
                let totalositions = current.totalPositions,
                let locations = current.locations,
                let salary = current.salary,
                let date = current.date
                else { return nil }
            let positionDetail = self.mapPositionDetail(locations: locations, totalPositions: totalositions)
            let salaryMapped = self.mapSalaryText(salary: salary)
            return SuggestionItemDomain(title: title, companyName: companyTitle, date: date, positionDetail: positionDetail, salary: salaryMapped, buttonTitle: Constant.View.defaultButtonTitle)
        })
    }

    private func mapSalaryText(salary: Salary) -> String {
        guard let real = salary.real,
            !real.isEmpty else { return self.mapSalaryRange(salary: salary) }
        return real
    }
    
    private func mapSalaryRange(salary: Salary) -> String {
        guard let range = salary.range,
            !range.isEmpty else { return "" }
        return range
    }
    
    private func mapPositionDetail(locations: [String], totalPositions: Int) -> String {
        guard let firstLocation = locations.first else { return "" }
        let totalLocations = locations.count
        return "\(totalPositions) vagas - \(firstLocation) + \(totalLocations) cidades"
    }
}

// MARK: - SUGGESTION ITEM -
struct SuggestionItemDomain {
    let title, companyName, date, positionDetail, salary: String
    var buttonTitle: String
}

// MARK: - TIP ACTION TYPE -
enum TipActionEnum: String {
    case like = "like"
    case disLike = "dislike"
}
