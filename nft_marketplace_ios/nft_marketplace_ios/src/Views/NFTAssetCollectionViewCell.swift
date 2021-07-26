//
//  NFTAssetCollectionViewCell.swift
//  nft_marketplace_ios
//
//  Created by Heriberto Prieto on 7/25/21.
//

import UIKit

class NFTAssetCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Subviews
    
    private(set) lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var descriptionLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var priceTitleLabel: UILabel = {
        let view = UILabel()
        view.textAlignment = .right
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var priceLabel: UILabel = {
        let view = UILabel()
        view.textAlignment = .right
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Setup
    
    private func setup() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(priceTitleLabel)
        addSubview(priceLabel)
        
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: priceTitleLabel.topAnchor).isActive = true
        
        descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: priceLabel.leftAnchor).isActive = true
        
        titleLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: descriptionLabel.leftAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: priceTitleLabel.leftAnchor).isActive = true
        
        priceLabel.bottomAnchor.constraint(equalTo: descriptionLabel.bottomAnchor).isActive = true
        priceLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        priceLabel.widthAnchor.constraint(lessThanOrEqualTo: widthAnchor, multiplier: 0.33).isActive = true
        priceLabel.widthAnchor.constraint(greaterThanOrEqualTo: priceTitleLabel.widthAnchor).isActive = true
        
        priceTitleLabel.bottomAnchor.constraint(equalTo: priceLabel.topAnchor).isActive = true
        priceTitleLabel.rightAnchor.constraint(equalTo: priceLabel.rightAnchor).isActive = true
        priceTitleLabel.widthAnchor.constraint(lessThanOrEqualTo: widthAnchor, multiplier: 0.33).isActive = true
    }
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
