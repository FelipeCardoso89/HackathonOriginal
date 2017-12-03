//
//  CustomerOfferCollectionViewCell.swift
//  BancoOriginal
//
//  Created by Felipe Antonio Cardoso on 03/12/2017.
//  Copyright © 2017 Felipe Antonio Cardoso. All rights reserved.
//

import UIKit

protocol CustomerOfferCollectionViewCellDelegate: class {
    func showConfirmationAlert(_ name: String)
    func showDefaultAlert()
}

class CustomerOfferCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceTitle: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var profitPercentegeLabel: UILabel!
    @IBOutlet weak var acceptButton: UIButton!
    
    var model: PriceOfferAnalysis? {
        didSet{ update() }
    }
    
    weak var delegate: CustomerOfferCollectionViewCellDelegate?
    
    func configure(_ model: PriceOfferAnalysis) {
        self.model = model
    }
    
    func update() {
        self.profileImageView.image = model?.profileImage
        self.nameLabel.text = model?.userName
        self.priceLabel.text = model?.offerAmount
        self.profitPercentegeLabel.text =  "\(model?.profitPercent ?? 0)%"
        self.backgroundColor = UIColor(red:0.39, green:0.69, blue:0.32, alpha:1.0)
        self.acceptButton.backgroundColor = (model?.profitPercent ?? 0 < 0) ? UIColor(red:0.98, green:0.05, blue:0.11, alpha:1.0) : UIColor(red:0.39, green:0.69, blue:0.32, alpha:1.0)
        self.profitPercentegeLabel.backgroundColor = (model?.profitPercent ?? 0 < 0) ?  UIColor(red:0.98, green:0.05, blue:0.11, alpha:1.0) : UIColor(red:0.39, green:0.69, blue:0.32, alpha:1.0)
    }
    
    override func layoutSubviews() {
        
        acceptButton.layer.cornerRadius = 10.0
        
        layer.cornerRadius = 10.0
        clipsToBounds = true
        
        self.profitPercentegeLabel.layer.cornerRadius = (self.profitPercentegeLabel.bounds.size.width / 2.0)
        self.profitPercentegeLabel.clipsToBounds = true
    }
    
    @IBAction func performAction(_ sender: Any) {
        if let name = model?.userName {
            self.delegate?.showConfirmationAlert(name)
        } else {
            self.delegate?.showDefaultAlert()
        }
    }
    
    
}
