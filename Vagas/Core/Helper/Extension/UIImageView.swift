//
//  UIImageView.swift
//  Vagas
//
//  Created by Hugo Coutinho on 16/02/21.
//  Copyright © 2021 Hugo Coutinho. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFill) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
    
    func setRounded() {
           self.layer.cornerRadius = (self.frame.width / 2)
           self.layer.masksToBounds = true
           self.layer.borderColor = UIColor.white.cgColor
           self.layer.borderWidth = 1
       }
}

// MARK: - AUX METHODS -
extension UIImageView {
    private func setImage(image: UIImage?) {
        guard let image = image else { return }
        DispatchQueue.main.async() { [weak self] in
            self?.image = image
        }
    }
    
    
    private func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFill) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { self.setImage(image: UIImage(named: Constant.ImageName.user)); return }
            self.setImage(image: image)
        }.resume()
    }
}
