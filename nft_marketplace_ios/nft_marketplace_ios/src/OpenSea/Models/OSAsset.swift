//
//  OSAsset.swift
//  nft_marketplace_ios
//
//  Created by Heriberto Prieto on 7/25/21.
//

import UIKit

struct OSAsset: Codable {
    public var tokenId: String?
    public var imageUrl: String?
    public var backgroundColor: String?
    public var name: String?
    public var externalLink: String?
    public var assetContract: OSAssetContract?
    public var owner: OSOwner?
    public var traits: [OSTrait]?
    public var lastSale: CGFloat?
    
    private enum CodingKeys: String, CodingKey {
        case tokenId = "token_id"
        case imageUrl = "image_url"
        case backgroundColor = "background_color"
        case name = "name"
        case externalLink = "external_link"
        case assetContract = "asset_contract"
        case owner = "owner"
        case traits = "traits"
        case lastSale = "last_sale"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        tokenId = try container.decodeIfPresent(String.self, forKey: .tokenId)
        imageUrl = try container.decodeIfPresent(String.self, forKey: .imageUrl)
        backgroundColor = try container.decodeIfPresent(String.self, forKey: .backgroundColor)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        externalLink = try container.decodeIfPresent(String.self, forKey: .externalLink)
        assetContract = try container.decodeIfPresent(OSAssetContract.self, forKey: .assetContract)
        owner = try container.decodeIfPresent(OSOwner.self, forKey: .owner)
        traits = try container.decodeIfPresent([OSTrait].self, forKey: .traits)
        lastSale = try container.decodeIfPresent(CGFloat.self, forKey: .lastSale)
    }
}

class OSAssetResponse: Codable {
    public var assets: [OSAsset]?
    public var success: Bool?
    
    private enum CodingKeys: String, CodingKey {
        case assets = "assets"
        case success = "success"
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        assets = try container.decodeIfPresent([OSAsset].self, forKey: .assets)
        success = try container.decodeIfPresent(Bool.self, forKey: .success)
    }
}
