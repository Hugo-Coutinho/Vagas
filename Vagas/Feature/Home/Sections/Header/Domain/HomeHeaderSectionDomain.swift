//
//  HomeHeaderSectionDomain.swift
//  Vagas
//
//  Created by Hugo Coutinho on 15/02/21.
//  Copyright © 2021 Hugo Coutinho. All rights reserved.
//

import Foundation
import UIKit

struct HomeHeaderSectionDomain {
    var profileImage: UIImageView = UIImageView()
    var name: String = ""
    
    init() {}
    
    init(profile: ProfileEntity) {
        self.name = profile.name ?? ""
        self.profileImage.downloaded(from: profile.photo ?? "")
    }
}
