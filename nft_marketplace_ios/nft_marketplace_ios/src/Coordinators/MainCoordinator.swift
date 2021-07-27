//
//  MainCoordinator.swift
//  nft_marketplace_ios
//
//  Created by Heriberto Prieto on 7/20/21.
//

import UIKit

class MainCoordinator {
    
    // MARK: - Tab
    
    enum Tab: Int, RawRepresentable {
        case home
        
        public var title: String {
            let title: String
            
            switch self {
            case .home:
                title = "Home"
            }
            
            return title
        }
        
        public var image: UIImage? {
            let imageName: String
            
            switch self {
            case .home:
                imageName = "house"
            }
            
            return UIImage(systemName: imageName)
        }
        
        public static func TabBarItem(for tab: Tab) -> UITabBarItem {
            UITabBarItem(
                title: tab.title,
                image: tab.image,
                tag: tab.rawValue
            )
        }
    }
    
    // MARK: - Destination
    
    enum Destination: Int, RawRepresentable {
        case root
        case assetDetail
    }
    
    // MARK: - Private Properties
    
    private let window: UIWindow?
    
    // MARK: - NavigationControllers
    
    private(set) lazy var rootNavigationController: UINavigationController = {
        UINavigationController(
            rootViewController: make(viewControllerFor: .root)
        )
    }()
    
    // MARK: - ViewControllers
    
    private(set) lazy var tokenMarketCollectionViewController: TokenMarketCollectionViewController = { [unowned self] in
        let controller = TokenMarketCollectionViewController()
        controller.assetDelegate = self
        return controller
    }()
    
    private(set) lazy var osAssetDetailViewController: OSAssetDetailViewController = {
        let controller = OSAssetDetailViewController()
        return controller
    }()
    
    // MARK: - Private Methods
    
    private func make(viewControllerFor destination: Destination) -> UIViewController {
        let viewController: UIViewController
        
        switch destination {
        case .root:
            viewController = tokenMarketCollectionViewController
        case .assetDetail:
            viewController = osAssetDetailViewController
        }
        
        return viewController
    }
    
    // MARK: - Public Methods
    
    public func show(viewControllerFor destination: Destination = .root) {
        let viewController: UIViewController = make(viewControllerFor: destination)
        
        // assure desired viewController is not already presented
        guard rootNavigationController.presentedViewController != viewController else {
            return
        }
        
        switch destination {
        case .root:
            rootNavigationController.viewControllers = [rootNavigationController]
        case .assetDetail:
            rootNavigationController.pushViewController(
                viewController,
                animated: true
            )
        }
    }
    
    // MARK: - Init
    
    init(window: UIWindow?) {
        self.window = window
        self.window?.rootViewController = rootNavigationController
    }
}

// MARK: - TokenMarketCollectionViewControllerDelegate

extension MainCoordinator: TokenMarketCollectionViewControllerDelegate {
    
    func tokenMarketCollectionViewController(_ controller: TokenMarketCollectionViewController, didSelectAssetAt indexPath: IndexPath, asset: OSAsset) {
        osAssetDetailViewController.asset = asset
        show(viewControllerFor: .assetDetail)
    }
}
