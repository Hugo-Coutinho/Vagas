//
//  HomeService.swift
//  Vagas
//
//  Created by Hugo Coutinho on 15/02/21.
//  Copyright © 2021 Hugo Coutinho. All rights reserved.
//

import Foundation
import Alamofire

class HomeService: HomeServiceInput {
    
    // MARK: - CONSTRUCTOR -
    init() {}
    
    func getKeys(completionHandler: @escaping (Data) -> Void) {
        let url = Constant.APIConstant.baseURLString + Constant.APIConstant.keys
        self.doRequest(url: url) { (data) in
            completionHandler(data)
        }
    }
    
    func getProfile(authorization: String, completionHandler: @escaping (Data) -> Void) {
        let url = Constant.APIConstant.baseURLString + Constant.APIConstant.auth + Constant.APIConstant.id
        let headers = [Constant.APIConstant.Header.xApiKey: authorization]
        self.doRequest(url: url, header: headers) { (data) in
            completionHandler(data)
        }
    }
    
    func getSuggestion(token: String, suggestionHeader: String, completionHandler: @escaping (Data) -> Void) {
        let url = Constant.APIConstant.baseURLString + Constant.APIConstant.suggestion
        let headers = [
            Constant.APIConstant.Header.Authorization: token,
            Constant.APIConstant.Header.xApiKey: suggestionHeader
        ]
        self.doRequest(url: url, header: headers) { (data) in
            completionHandler(data)
        }
    }
    
    func getTips(tipsHeader: String, completionHandler: @escaping (Data) -> Void) {
        let url = Constant.APIConstant.baseURLString + Constant.APIConstant.tips
        let headers = [
            Constant.APIConstant.Header.xApiKey: tipsHeader
        ]
        self.doRequest(url: url, header: headers) { (data) in
            completionHandler(data)
        }
    }
    
    private func doRequest(url: String, header: [String: String]? = [:], completionHandler: @escaping (Data) -> Void) {
        Alamofire.request(url, headers: header).validate(statusCode: 200..<300).responseJSON { result -> Void in
                if let data = result.data {
                    completionHandler(data)
            } else {
                print("error")
            }
        }
    }
}
