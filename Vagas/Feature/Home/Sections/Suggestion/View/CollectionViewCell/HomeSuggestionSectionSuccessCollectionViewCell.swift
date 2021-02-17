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
    func didTapSendCV(row: Int)
}

class HomeSuggestionSectionSuccessCollectionViewCell: UICollectionViewCell {

    // MARK: - OUTLETS -
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var positionDetailLabel: UILabel!
    @IBOutlet weak var salaryLabel: UILabel!
    @IBOutlet weak var buttonCell: UIButton!
    
    // MARK: - VARIABLES -
    private var output: HomeSuggestionSectionSuccessCollectionOutput?
    var row: Int = 0
    
    
    // MARK: - LIFECYCLE -
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func prepareForReuse() {
        self.buttonCell.setTitle(Constant.View.defaultButtonTitle, for: .normal)
    }
    
    // MARK: - ACTION -
    @IBAction func doAction(_ sender: Any) {
        self.buttonCell.setTitle(Constant.View.userDidSendCVButtonTitle, for: .normal)
        self.output?.didTapSendCV(row: self.row)
    }
    
    
    // MARK: - SETUP -
    func setup(suggestion: SuggestionItemDomain, output: HomeSuggestionSectionSuccessCollectionOutput) {
        self.output = output
        self.titleLabel.text = suggestion.title
        self.dateLabel.text = suggestion.date
        self.companyNameLabel.text = suggestion.companyName
        self.salaryLabel.text = suggestion.salary
        self.positionDetailLabel.text = suggestion.positionDetail
        self.buttonCell.setTitle(suggestion.buttonTitle, for: .normal)
    }
}
