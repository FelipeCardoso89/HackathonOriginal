//
//  SellerCollectionViewController.swift
//  BancoOriginal
//
//  Created by Felipe Antonio Cardoso on 03/12/2017.
//  Copyright © 2017 Felipe Antonio Cardoso. All rights reserved.
//

import UIKit

private let reuseIdentifier = "CustomerOfferCollectionViewCell"

class SellerCollectionViewController: UICollectionViewController {

    private let header = ProductHeader(productImage: UIImage(named: "Camera")!, productTitle: "Camera Fotográfica Nikon - D750", price: "R$4.000,00")
    
    private let offers: [PriceOfferAnalysis] = [
        PriceOfferAnalysis(profileImage: UIImage(named: "henrique"), userName: "Henrique", profitPercent: 52, offerAmount: "R$3.800,00"),
        PriceOfferAnalysis(profileImage: UIImage(named: "leila"), userName: "Leila", profitPercent: 50, offerAmount: "R$3.700,00"),
        PriceOfferAnalysis(profileImage: UIImage(named: "fabio"), userName: "Fabio", profitPercent: 28, offerAmount: "R$3.200,00"),
        PriceOfferAnalysis(profileImage: UIImage(named: "felipe"), userName: "Felipe", profitPercent: -20, offerAmount: "R$2.000,00")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return offers.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? CustomerOfferCollectionViewCell {
            cell.delegate = self
            cell.configure(offers[indexPath.row])
            return cell
        } else {
            return UICollectionViewCell()
        }
    }

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ProductHeaderReusableView", for: indexPath) as? ProductHeaderReusableView {
            view.delegate = self
            view.configure(header)
            return view
        } else {
            return UICollectionReusableView()
        }
    }
}

extension SellerCollectionViewController: ProductHeaderReusableViewDelegate {
    func showPriceVariance() {
        performSegue(withIdentifier: "goToGraphics", sender: nil)
    }
}

extension SellerCollectionViewController: CustomerOfferCollectionViewCellDelegate {
    
    func showConfirmationAlert(_ name: String) {
        
        let message = "Sua proposta de venda foi enviada para \(name). Você será notificado caso realize a venda."
        let alert = UIAlertController(title: "Proposta enviada!", message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    func showDefaultAlert() {
        let message = "Sua proposta de venda foi enviada. Você será notificado caso realize a venda."
        let alert = UIAlertController(title: "Proposta enviada!", message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
}

