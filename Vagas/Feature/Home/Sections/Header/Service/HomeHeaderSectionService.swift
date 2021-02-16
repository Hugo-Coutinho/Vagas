//
//  HomeHeaderSectionService.swift
//  Vagas
//
//  Created by Hugo Coutinho on 16/02/21.
//  Copyright © 2021 Hugo Coutinho. All rights reserved.
//

import Foundation
import Alamofire

class HomeHeaderService: HomeHeaderServiceInput {
    
    // MARK: - CONSTRUCTOR -
    init() {}

    func getProfile(authorization: String, completionHandler: @escaping (Data) -> Void) {
        let url = Constant.APIConstant.baseURLString + Constant.APIConstant.auth + Constant.APIConstant.id
        let headers = [Constant.APIConstant.Header.xApiKey: authorization]
        BaseRequest.doRequest(url: url, header: headers) { (data) in
            completionHandler(data)
        }
    }
}
