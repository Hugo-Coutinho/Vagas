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
    func didTapTipPreference(type: TipActionEnum)
}

class HomeTipsSectionSuccessTableViewCell: UITableViewCell {

    // MARK: - OUTLETS -
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var likeImageView: UIImageView!
    @IBOutlet weak var dislikeImageView: UIImageView!
    
    // MARK: - VARIABLES -
    var delegate: HomeTipsSectionSuccessDelegate?
    private var urlString: String = ""

    
    // MARK: - OVERRIDE -
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - ACTIONS -
    @IBAction func doAction(_ sender: Any) {
            guard let url = URL(string: self.urlString) else { return }
            UIApplication.shared.open(url)
    }
    
    
    @IBAction func didTapLikeTip(_ sender: Any) {
        self.delegate?.didTapTipPreference(type: .like)
    }
    
    @IBAction func didTapDislikeTip(_ sender: Any) {
        self.delegate?.didTapTipPreference(type: .disLike)
    }
    
    
    // MARK: - SETUP -
    func setup(tips: TipsItemDomain) {
        self.descriptionLabel.text = tips.description
        self.button.setTitle(tips.buttonTitle, for: .normal)
        self.button.isHidden = !tips.isShowButton
        self.urlString = tips.url
        self.button.setBorder()
    }
}
