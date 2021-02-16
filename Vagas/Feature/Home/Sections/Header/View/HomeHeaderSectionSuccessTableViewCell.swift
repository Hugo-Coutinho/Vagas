//
//  HomeHeaderSectionSuccessTableViewCell.swift
//  Vagas
//
//  Created by Hugo Coutinho on 16/02/21.
//  Copyright © 2021 Hugo Coutinho. All rights reserved.
//

import UIKit

protocol HomeHeaderSectionSuccessDelegate {
    
}

class HomeHeaderSectionSuccessTableViewCell: UITableViewCell {
    
    // MARK: - OUTLETS -
    @IBOutlet weak var nameLabel: UILabel!
    
    // MARK: - VARIABLES -
    var delegate: HomeHeaderSectionSuccessDelegate?
    
    // MARK: - OVERRIDE METHODS -
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - SETUP -
    func setup(name: String) {
        self.nameLabel.text = name
    }
}
