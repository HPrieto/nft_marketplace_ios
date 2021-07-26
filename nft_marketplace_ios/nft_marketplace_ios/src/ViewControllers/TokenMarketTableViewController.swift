//
//  TokenMarketTableViewController.swift
//  nft_marketplace_ios
//
//  Created by Heriberto Prieto on 7/20/21.
//

import UIKit

class TokenMarketTableViewController: UIViewController {
    
    var models: [OSAsset] = [OSAsset]()
    
    // MARK: - Private Properties
    
    private var cellWidth: CGFloat {
        (view.bounds.width - 10) / 2
    }
    
    // MARK: - Subviews
    
    private(set) lazy var collectionView: UICollectionView = {
        let view = UICollectionView(
            frame: .zero,
            collectionViewLayout: UICollectionViewFlowLayout()
        )
        view.backgroundColor = .clear
        view.delegate = self
        view.dataSource = self
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(NFTAssetCollectionViewCell.self, forCellWithReuseIdentifier: NFTAssetCollectionViewCell.reuseIdentifier)
        return view
    }()
    
    // MARK: - Setup
    
    private func setup() {
        view.backgroundColor = .orange
        
        view.addSubview(collectionView)
        
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        NetworkManager.shared.request(
            type: OSAssetResponse.self,
            from: OSEndpoint.assets(
                orderDirection: .desc,
                offset: 0,
                limit: 20
            )
        ) { result in
            switch result {
            case .success(let result):
                guard let assets = result.assets else { return }
                self.models = assets
                self.collectionView.reloadData()
            case .failure(let error):
                print("Error: ", error)
            }
        }
    }
}

extension TokenMarketTableViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(
            width: cellWidth,
            height: 240
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: NFTAssetCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: NFTAssetCollectionViewCell.reuseIdentifier, for: indexPath) as! NFTAssetCollectionViewCell
        let model: OSAsset = models[indexPath.row]
        cell.titleLabel.text = model.collection?.name
        cell.descriptionLabel.text = model.description
        cell.priceLabel.text = "\(model.lastSale ?? 0.00)"
        cell.priceTitleLabel.text = "Price"
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        models.count
    }
}
