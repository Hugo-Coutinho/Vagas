//
//  Thread.swift
//  Vagas
//
//  Created by Hugo Coutinho on 15/02/21.
//  Copyright © 2021 Hugo Coutinho. All rights reserved.
//

import Foundation

func executeInBackground(_ completion: @escaping () -> Void ) {
    DispatchQueue.global(qos: .background).async {
        completion()
    }
}

func executeOnMainQueue(force: Bool = false, _ completion: @escaping () -> Void ) {
    if Thread.isMainThread && !force {
        completion()
    } else {
        
        DispatchQueue.main.async(execute: {
            completion()
        })
    }
}

