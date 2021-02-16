//
//  HomeHeaderSectionBuilder.swift
//  Vagas
//
//  Created by Hugo Coutinho on 15/02/21.
//  Copyright © 2021 Hugo Coutinho. All rights reserved.
//

import Foundation
import UIKit

final class HomeHeaderSectionBuilder {
    
    // MARK: - CONSTRUCTOR -
    init(){}
    
    // MARK: - BUILDER -
    func make(profile: HomeHeaderSectionDomain, output: HomeHeaderSectionOutput) -> HomeHeaderSection {
        let section = HomeHeaderSection()
        section.output = output
        section.profile = profile
        section.startSection()
        return section
    }
}
