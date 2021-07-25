//
//  OSAsset.swift
//  nft_marketplace_ios
//
//  Created by Heriberto Prieto on 7/25/21.
//

import Foundation

struct OSAsset: Codable {
    public var tokenId: String?
    public var imageUrl: String?
    public var backgroundColor: String?
    public var name: String?
    public var externalLink: String?
    public var assetContract: String?
    public var owner: String?
    public var traits: String?
    public var lastSale: String?
    
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
        assetContract = try container.decodeIfPresent(String.self, forKey: .assetContract)
        owner = try container.decodeIfPresent(String.self, forKey: .owner)
        traits = try container.decodeIfPresent(String.self, forKey: .traits)
        lastSale = try container.decodeIfPresent(String.self, forKey: .lastSale)
    }
}
