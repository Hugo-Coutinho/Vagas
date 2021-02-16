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
    @IBOutlet weak var imageProfile: UIImageView!
    
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
    func setup(domain: HomeHeaderSectionDomain) {
        self.nameLabel.text = domain.name
        self.imageProfile.image = UIImage(named: Constant.ImageName.user)
        self.imageProfile.setRounded()
    }
}
