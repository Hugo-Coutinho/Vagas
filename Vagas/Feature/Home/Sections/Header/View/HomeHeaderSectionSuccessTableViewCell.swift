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
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var delegate: HomeHeaderSectionSuccessDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(name: String) {
        self.nameLabel.text = name
    }
}
