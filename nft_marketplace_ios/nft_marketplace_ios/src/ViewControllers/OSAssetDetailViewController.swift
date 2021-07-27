//
//  OSAssetDetailViewController.swift
//  nft_marketplace_ios
//
//  Created by Heriberto Prieto on 7/26/21.
//

import UIKit

class OSAssetDetailViewController: UIViewController {
    
    // MARK: - Public Properties
    
    public var asset: OSAsset? {
        didSet {
            guard let asset: OSAsset = asset else {
                reset()
                return
            }
            
            if let collectionName: String = asset.collection?.name {
                collectionNameLabel.text = collectionName
            }
            
            if let assetName: String = asset.name {
                assetNameLabel.text = assetName
            }
            
            if let imageUrl: String = asset.imageUrl {
                imageView.setImage(fromUrlString: imageUrl)
            }
            
            if let ownerUsername: String = asset.owner?.user?.username {
                ownerLabel.text = ownerUsername
            }
        }
    }
    
    // MARK: - Private Methods
    
    private func reset() {
        collectionNameLabel.text = ""
        assetNameLabel.text = ""
        imageView.image = nil
        ownerLabel.text = ""
    }
    
    // MARK: - Subviews
    
    private(set) lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.alwaysBounceVertical = true
        view.alwaysBounceHorizontal = false
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var stackView: UIStackView = {
        let view = UIStackView(
            arrangedSubviews: [
                collectionNameLabel,
                assetNameLabel,
                imageView,
                ownerLabel
            ]
        )
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var collectionNameLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var assetNameLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .lightGray
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        return view
    }()
    
    private(set) lazy var ownerLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Setup
    
    private func setup() {
        view.backgroundColor = .white
        
        view.addSubview(scrollView)
        
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        scrollView.addSubview(stackView)
        
        stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        asset = nil
    }
}
