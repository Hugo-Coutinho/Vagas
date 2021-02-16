//
//  SectionOutput.swift
//  Vagas
//
//  Created by Hugo Coutinho on 15/02/21.
//  Copyright © 2021 Hugo Coutinho. All rights reserved.
//

import Foundation
import UIKit

protocol SectionOutput: class  {
    func endRefreshing(error: String?)
    func reloadSection(section: Section, animation:UITableView.RowAnimation)
    func setSelectedCell(from index: Int, in section: Section, animated:Bool, scrollPosition:UITableView.ScrollPosition)
    func removeItem(from index: Int, in section: Section, animation:UITableView.RowAnimation, completion: (() -> Void)?)
}

