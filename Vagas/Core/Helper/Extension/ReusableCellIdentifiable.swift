//
//  ReusableCellIdentifiable.swift
//  Vagas
//
//  Created by Hugo Coutinho on 16/02/21.
//  Copyright © 2021 Hugo Coutinho. All rights reserved.
//

import Foundation
import UIKit

protocol ReusableCellIdentifiable {
    static var reusableIdentifier: String { get }
}

extension ReusableCellIdentifiable {
    static var reusableIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReusableCellIdentifiable {}
extension UICollectionReusableView: ReusableCellIdentifiable {}

