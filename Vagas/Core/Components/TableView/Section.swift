//
//  Section.swift
//  Vagas
//
//  Created by Hugo Coutinho on 15/02/21.
//  Copyright © 2021 Hugo Coutinho. All rights reserved.
//

import Foundation

class Section: NSObject {
    weak var output: SectionOutput?
    var items: [Any] = []
    var scene: SectionsScenes = .all
}

enum SectionsScenes {
    case sceneloading
    case sceneError
    case sceneSuccess
    case all
}
