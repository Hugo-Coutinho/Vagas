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
        BaseRequest.doRequest(url: url) { (data) in
            completionHandler(data)
        }
    }
    
    func getProfile(authorization: String, completionHandler: @escaping (Data) -> Void) {
        let url = Constant.APIConstant.baseURLString + Constant.APIConstant.auth + Constant.APIConstant.id
        let headers = [Constant.APIConstant.Header.xApiKey: authorization]
        BaseRequest.doRequest(url: url, header: headers) { (data) in
            completionHandler(data)
        }
    }
}
