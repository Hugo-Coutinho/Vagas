//
//  Constant.swift
//  Vagas
//
//  Created by Hugo Coutinho on 15/02/21.
//  Copyright © 2021 Hugo Coutinho. All rights reserved.
//

import Foundation

struct Constant {
    struct APIConstant {
        public static let baseURLString = "http://localhost:4040/"
        public static let keys = "keys/"
        public static let auth = "auth/"
        public static let id = "ee09bd39-4ca2-47ac-9c5e-9c57ba5a26dc"
        public static let suggestion = "suggestion"
        public static let tips = "tips"
        public static let survey = "survey/tips/"
        
        struct Header {
            public static let Authorization = "Authorization"
            public static let xApiKey = "x-api-key"
        }
    }
    
    struct View {
        public static let userDidSendCVButtonTitle = "CV enviado"
        public static let defaultButtonTitle = "ENVIAR CURRÍCULO"
    }
    
    struct ImageName {
        public static let user = "user"
        
    }
}

