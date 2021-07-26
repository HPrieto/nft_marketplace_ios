//
//  TokenMarketTableViewController.swift
//  nft_marketplace_ios
//
//  Created by Heriberto Prieto on 7/20/21.
//

import UIKit

class TokenMarketTableViewController: UIViewController {
    
    // MARK: - Subviews
    
    
    
    // MARK: - Setup
    
    private func setup() {
        view.backgroundColor = .orange
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
                limit: 10
            )
        ) { result in
            switch result {
            case .success(let result):
                print(result.assets?.count ?? 0)
            case .failure(let error):
                print("Error: ", error)
            }
        }
    }
}
