//
//  UIButton.swift
//  Vagas
//
//  Created by Hugo Coutinho on 16/02/21.
//  Copyright © 2021 Hugo Coutinho. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    func setBorder() {
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.blue.cgColor
        self.layer.cornerRadius = self.bounds.height/2
    }
}

