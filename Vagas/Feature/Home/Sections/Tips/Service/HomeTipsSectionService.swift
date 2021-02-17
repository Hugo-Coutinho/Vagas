//
//  HomeTipsSectionService.swift
//  Vagas
//
//  Created by Hugo Coutinho on 16/02/21.
//  Copyright © 2021 Hugo Coutinho. All rights reserved.
//

import Foundation

class HomeTipsService: HomeTipsServiceInput {
    
    // MARK: - CONSTRUCTOR -
    init() {}
    
    func postTip(tipHeader: String, token: String, tipAction: String, tipId: String, completionHandler: @escaping (Data) -> Void) {
        let url = Constant.APIConstant.baseURLString + Constant.APIConstant.survey + tipId + "/" + tipAction
        let headers = [
            Constant.APIConstant.Header.xApiKey: tipHeader,
            Constant.APIConstant.Header.Authorization: token,
        ]
        BaseRequest.doRequest(method: .post, url: url, header: headers) { (data) in
            completionHandler(data)
        }
    }
    
    func getTips(tipsHeader: String, completionHandler: @escaping (Data) -> Void) {
        let url = Constant.APIConstant.baseURLString + Constant.APIConstant.tips
        let headers = [
            Constant.APIConstant.Header.xApiKey: tipsHeader
        ]
        BaseRequest.doRequest(url: url, header: headers) { (data) in
            completionHandler(data)
        }
    }
}
