//
//  UITableView.swift
//  Vagas
//
//  Created by Hugo Coutinho on 16/02/21.
//  Copyright © 2021 Hugo Coutinho. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    func registerTableViewCell<T: ReusableCellIdentifiable>(_ cell: T.Type) {
        register(
            UINib(
                nibName: String(describing: cell),
                bundle: nil
            ),
            forCellReuseIdentifier: T.reusableIdentifier
        )
    }
}
