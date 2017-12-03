//
//  BalanceCollectionViewCell.swift
//  BancoOriginal
//
//  Created by Felipe Antonio Cardoso on 03/12/2017.
//  Copyright © 2017 Felipe Antonio Cardoso. All rights reserved.
//

import UIKit

class BalanceCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var currentBalanceTitleLabel: UILabel!
    @IBOutlet var currentBalanceLabel: UILabel!
    
    @IBOutlet var availableLimitTitleLabel: UILabel!
    @IBOutlet var availableLimitLabel: UILabel!
    
    @IBOutlet var currentLimitTitleLabel: UILabel!
    @IBOutlet var currentLimitLabel: UILabel!
    
    
    func configure(_ viewModel: BalanceCollectionCellViewModel) {
        currentBalanceTitleLabel.text = viewModel.currentBalanceTitle
        currentBalanceLabel.text = viewModel.currentBalance
        currentLimitTitleLabel.text = viewModel.currentLimitTitle
        currentLimitLabel.text = viewModel.currentLimit
        availableLimitTitleLabel.text = viewModel.availableLimitTitle
        availableLimitLabel.text = viewModel.availableLimit
    }
    
}
