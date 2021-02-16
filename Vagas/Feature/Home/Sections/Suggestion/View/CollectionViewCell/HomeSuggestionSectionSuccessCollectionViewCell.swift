//
//  HomeSuggestionSectionSuccessCollectionViewCell.swift
//  Vagas
//
//  Created by Hugo Coutinho on 16/02/21.
//  Copyright © 2021 Hugo Coutinho. All rights reserved.
//

import UIKit

// MARK: - COLLECTION OUTPUT -
public protocol HomeSuggestionSectionSuccessCollectionOutput {
    
}

class HomeSuggestionSectionSuccessCollectionViewCell: UICollectionViewCell {

    // MARK: - OUTLETS -
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var positionDetailLabel: UILabel!
    @IBOutlet weak var salaryLabel: UILabel!
    
    // MARK: - VARIABLES -
    private var output: HomeSuggestionSectionSuccessCollectionOutput?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    // MARK: - SETUP -
    func setup(suggestion: SuggestionItemDomain, output: HomeSuggestionSectionSuccessCollectionOutput) {
        self.output = output
        self.titleLabel.text = suggestion.title
        self.dateLabel.text = suggestion.date
        self.companyNameLabel.text = suggestion.companyName
        self.salaryLabel.text = suggestion.salary
        self.positionDetailLabel.text = suggestion.positionDetail
    }
}
