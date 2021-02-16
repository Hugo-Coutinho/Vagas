//
//  HomeTipsSectionSuccessTableViewCell.swift
//  Vagas
//
//  Created by Hugo Coutinho on 16/02/21.
//  Copyright © 2021 Hugo Coutinho. All rights reserved.
//

import UIKit

// MARK: - DELEGATE -
protocol HomeTipsSectionSuccessDelegate {
    
}

class HomeTipsSectionSuccessTableViewCell: UITableViewCell {

    // MARK: - VARIABLES -
    var delegate: HomeTipsSectionSuccessDelegate?

    
    // MARK: - OVERRIDE -
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    // MARK: - SETUP -
    func setup(tips: HomeTipsSectionDomain) {
        
    }
}
