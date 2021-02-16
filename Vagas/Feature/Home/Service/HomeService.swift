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
}
