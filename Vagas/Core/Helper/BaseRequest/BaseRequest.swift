//
//  BaseRequest.swift
//  Vagas
//
//  Created by Hugo Coutinho on 16/02/21.
//  Copyright © 2021 Hugo Coutinho. All rights reserved.
//

import Foundation
import Alamofire

class BaseRequest {
    class func doRequest(url: String, header: [String: String]? = [:], completionHandler: @escaping (Data) -> Void) {
        Alamofire.request(url, headers: header).validate(statusCode: 200..<300).responseJSON { result -> Void in
                if let data = result.data {
                    completionHandler(data)
            } else {
                print("error")
            }
        }
    }
}
