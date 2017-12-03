//
//  CustomerViewController.swift
//  BancoOriginal
//
//  Created by Felipe Antonio Cardoso on 03/12/2017.
//  Copyright © 2017 Felipe Antonio Cardoso. All rights reserved.
//

import UIKit

class CustomerViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    private var viewModel: CustomerViewModel? {
        didSet{ collectionView.reloadData() }
    }
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var customerNameLabel: UILabel!
    @IBOutlet var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func reloadData() {
        
        BancoOriginal.shared.accountService.balance { [weak self] (balance, error) in
            if let balance = balance {
                
                let offers = [
                    PriceOffer(productImage: UIImage(named: "Camera")!, productName: "Camera Fotografica", productPrice: 3800),
                    PriceOffer(productImage: UIImage(named: "Bateria")!, productName: "Bateria Eletrônica", productPrice: 6200),
                    PriceOffer(productImage: UIImage(named: "Longboard")!, productName: "Skate Longboard", productPrice: 350)
                ]
                
                let customerModel = CustomerModel(
                    name: "Henrique Cardoso",
                    profilePhoto: Bundle.main.url(forResource: "", withExtension: ""),
                    balance: balance,
                    offers: offers
                )
                
                let viewModel = CustomerViewModel(model: customerModel)
                self?.configure(viewModel)
                
            } else {
                
                let message = "Parece que você esta sem internet. Conecte-se e tente novamente."
                let alert = UIAlertController(title: "Erro inesperado!", message: message, preferredStyle: UIAlertControllerStyle.alert)
                
                let action = UIAlertAction(title: "Tentar novamente.", style: UIAlertActionStyle.default, handler: { [weak self] ac in
                    self?.reloadData()
                })
                alert.addAction(action)
                
                self?.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    private func configure(_ viewModel: CustomerViewModel) {
        self.viewModel = viewModel
        self.customerNameLabel.text = viewModel.customerName
        self.profileImage.image = UIImage(named: "henrique")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.items.count ?? 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if let balance = viewModel?.items[indexPath.row] as? BOBalance {
            
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BalanceCollectionViewCell", for: indexPath) as? BalanceCollectionViewCell {
                cell.configure(BalanceCollectionCellViewModel(model: balance))
                return cell
            } else {
                return UICollectionViewCell()
            }
            
        } else if let offer = viewModel?.items[indexPath.row] as? PriceOffer {
            
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PriceOfferCollectionViewCell", for: indexPath) as? PriceOfferCollectionViewCell {
                let viewModel = PriceOfferCellViewModel(model: offer)
                cell.configure(viewModel)
                return cell
            } else {
                return UICollectionViewCell()
            }
            
        }else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let offer = viewModel?.items[indexPath.row] as? PriceOffer {
            self.performSegue(withIdentifier: "ProductOfferDetailViewController", sender: offer)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ProductOfferDetailViewController", let viewController = segue.destination as? ProductOfferDetailViewController, let offer = sender as? PriceOffer {
            viewController.viewModel = ProductOfferDetailViewModel(priceOffer: offer)
        }
    }
}
