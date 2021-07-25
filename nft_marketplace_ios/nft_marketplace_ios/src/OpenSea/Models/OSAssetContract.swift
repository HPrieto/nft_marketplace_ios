//
//  OSAssetContract.swift
//  nft_marketplace_ios
//
//  Created by Heriberto Prieto on 7/25/21.
//

import Foundation

struct OSAssetContract: Codable {
    public var address: String?
    public var name: String?
    public var symbol: String?
    public var imageUrl: String?
    public var description: String?
    public var externalLink: String?
    
    private enum CodingKeys: String, CodingKey {
        case address = "address"
        case name = "name"
        case symbol = "symbol"
        case imageUrl = "image_url"
        case description = "description"
        case externalLink = "external_link"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        address = try container.decodeIfPresent(String.self, forKey: .address)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        symbol = try container.decodeIfPresent(String.self, forKey: .symbol)
        imageUrl = try container.decodeIfPresent(String.self, forKey: .imageUrl)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        externalLink = try container.decodeIfPresent(String.self, forKey: .externalLink)
    }
}
