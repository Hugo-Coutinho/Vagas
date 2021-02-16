//
//  UICollectionView.swift
//  Vagas
//
//  Created by Hugo Coutinho on 16/02/21.
//  Copyright © 2021 Hugo Coutinho. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {
    func registerCollectionViewCell<T: ReusableCellIdentifiable>(_ cell: T.Type) {
        register(
            UINib(
                nibName: String(describing: cell),
                bundle: nil
            ),
            forCellWithReuseIdentifier: T.reusableIdentifier
        )
    }
    
    var centerPoint : CGPoint {
        
        get {
            return CGPoint(x: self.center.x + self.contentOffset.x, y: self.center.y + self.contentOffset.y);
        }
    }
    
    var centerCellIndexPath: IndexPath? {
        
        if let centerIndexPath = self.indexPathForItem(at: self.centerPoint) {
            return centerIndexPath
        }
        return nil
    }
    
}

extension UICollectionView {
    func register<T: UICollectionViewCell>(_: T.Type) {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        self.register(nib, forCellWithReuseIdentifier: T.reusableIdentifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        let dequeueReusableCell = self.dequeueReusableCell(withReuseIdentifier: T.reusableIdentifier, for: indexPath)
        guard let cell = dequeueReusableCell as? T else { return T() }
        return cell
    }
}

protocol NibLoadableView: class {
    static var nibName: String { get }
}

extension NibLoadableView {
    static var nibName: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: NibLoadableView {}
