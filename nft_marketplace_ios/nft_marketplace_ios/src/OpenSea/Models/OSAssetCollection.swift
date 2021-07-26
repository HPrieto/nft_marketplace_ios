//
//  OSAssetCollection.swift
//  nft_marketplace_ios
//
//  Created by Heriberto Prieto on 7/25/21.
//

import Foundation

struct OSAssetCollection: Codable {
    public var bannerImageUrl: String?
    public var description: String?
    public var hidden: Bool?
    public var imageUrl: String?
    public var name: String?
    
    private enum CodingKeys: String, CodingKey {
        case bannerImageUrl = "banner_image_url"
        case description = "description"
        case hidden = "hidden"
        case imageUrl = "image_url"
        case name = "name"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        bannerImageUrl = try container.decodeIfPresent(String.self, forKey: .bannerImageUrl)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        hidden = try container.decodeIfPresent(Bool.self, forKey: .hidden)
        imageUrl = try container.decodeIfPresent(String.self, forKey: .imageUrl)
        name = try container.decodeIfPresent(String.self, forKey: .name)
    }
}
