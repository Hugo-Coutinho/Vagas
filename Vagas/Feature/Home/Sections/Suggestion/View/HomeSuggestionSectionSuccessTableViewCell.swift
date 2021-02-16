//
//  HomeSuggestionSectionSuccessTableViewCell.swift
//  Vagas
//
//  Created by Hugo Coutinho on 16/02/21.
//  Copyright © 2021 Hugo Coutinho. All rights reserved.
//

import UIKit

protocol HomeSuggestionSectionSuccessDelegate {
    
}

class HomeSuggestionSectionSuccessTableViewCell: UITableViewCell {
    
    // MARK: - OUTLETS -
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - VARIABLES -
    var delegate: HomeSuggestionSectionSuccessDelegate?
    private var suggestion: HomeSuggestionSectionDomain = HomeSuggestionSectionDomain()
    
    // MARK: - OVERRIDE -
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // MARK: - SETUP -
    func setup(suggestion: HomeSuggestionSectionDomain) {
        print("\(suggestion)")
    }
}
