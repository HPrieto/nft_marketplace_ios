//
//  OSAsset.swift
//  nft_marketplace_ios
//
//  Created by Heriberto Prieto on 7/25/21.
//

import UIKit

struct OSAsset: Codable {
    public var tokenId: String?
    public var numSales: Int32?
    public var imageUrl: String?
    public var imagePreviewUrl: String?
    public var imageThumbnailUrl: String?
    public var imageOriginalUrl: String?
    public var isPresale: Bool?
    public var animationUrl: String?
    public var animationOriginalUrl: String?
    public var backgroundColor: String?
    public var name: String?
    public var description: String?
    public var externalLink: String?
    public var assetContract: OSAssetContract?
    public var owner: OSAccount?
    public var permalink: String?
    public var traits: [OSTrait]?
    public var lastSale: CGFloat?
    public var collection: OSAssetCollection?
    
    private enum CodingKeys: String, CodingKey {
        case tokenId = "token_id"
        case numSales = "num_sales"
        case imageUrl = "image_url"
        case imagePreviewUrl = "image_preview_url"
        case imageThumbnailUrl = "image_thumbnail_url"
        case imageOriginalUrl = "image_original_url"
        case isPresale = "is_presale"
        case animationUrl = "animation_url"
        case animationOriginalUrl = "animation_original_url"
        case backgroundColor = "background_color"
        case name = "name"
        case description = "description"
        case externalLink = "external_link"
        case assetContract = "asset_contract"
        case owner = "owner"
        case permalink = "permalink"
        case traits = "traits"
        case lastSale = "last_sale"
        case collection = "collection"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        do {
            tokenId = try String(container.decode(Int32.self, forKey: .tokenId))
        } catch DecodingError.typeMismatch {
            tokenId = try container.decodeIfPresent(String.self, forKey: .tokenId)
        }
        numSales = try container.decodeIfPresent(Int32.self, forKey: .numSales)
        imageUrl = try container.decodeIfPresent(String.self, forKey: .imageUrl)
        imagePreviewUrl = try container.decodeIfPresent(String.self, forKey: .imagePreviewUrl)
        imageThumbnailUrl = try container.decodeIfPresent(String.self, forKey: .imageThumbnailUrl)
        imageOriginalUrl = try container.decodeIfPresent(String.self, forKey: .imageOriginalUrl)
        isPresale = try container.decodeIfPresent(Bool.self, forKey: .isPresale)
        animationUrl = try container.decodeIfPresent(String.self, forKey: .animationUrl)
        animationOriginalUrl = try container.decodeIfPresent(String.self, forKey: .animationOriginalUrl)
        backgroundColor = try container.decodeIfPresent(String.self, forKey: .backgroundColor)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        externalLink = try container.decodeIfPresent(String.self, forKey: .externalLink)
        assetContract = try container.decodeIfPresent(OSAssetContract.self, forKey: .assetContract)
        owner = try container.decodeIfPresent(OSAccount.self, forKey: .owner)
        permalink = try container.decodeIfPresent(String.self, forKey: .permalink)
        traits = try container.decodeIfPresent([OSTrait].self, forKey: .traits)
        lastSale = try container.decodeIfPresent(CGFloat.self, forKey: .lastSale)
        collection = try container.decodeIfPresent(OSAssetCollection.self, forKey: .collection)
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
