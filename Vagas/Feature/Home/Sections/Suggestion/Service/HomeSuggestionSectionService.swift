//
//  HomeSuggestionSectionService.swift
//  Vagas
//
//  Created by Hugo Coutinho on 16/02/21.
//  Copyright © 2021 Hugo Coutinho. All rights reserved.
//

import Foundation

class HomeSuggestionService: HomeSuggestionServiceInput {
    
    // MARK: - CONSTRUCTOR -
    init() {}
    
    func getSuggestion(token: String, suggestionHeader: String, completionHandler: @escaping (Data) -> Void) {
        let url = Constant.APIConstant.baseURLString + Constant.APIConstant.suggestion
        let headers = [
            Constant.APIConstant.Header.Authorization: token,
            Constant.APIConstant.Header.xApiKey: suggestionHeader
        ]
        BaseRequest.doRequest(url: url, header: headers) { (data) in
            completionHandler(data)
        }
    }
}
