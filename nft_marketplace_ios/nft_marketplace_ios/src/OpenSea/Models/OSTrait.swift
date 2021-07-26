//
//  OSTrait.swift
//  nft_marketplace_ios
//
//  Created by Heriberto Prieto on 7/25/21.
//

import Foundation

struct OSTrait: Codable {
    public var traitType: String?
    public var value: String?
    public var displayType: String?
    public var traitCount: Int?
    public var maxValue: String?
    public var order: String?
    
    private enum CodingKeys: String, CodingKey {
        case traitType = "trait_type"
        case value = "value"
        case displayType = "display_type"
        case traitCount = "trait_count"
        case maxValue = "max_value"
        case order = "order"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        traitType = try container.decodeIfPresent(String.self, forKey: .traitType)
        value = try container.decodeIfPresent(String.self, forKey: .value)
        displayType = try container.decodeIfPresent(String.self, forKey: .displayType)
        traitCount = try container.decodeIfPresent(Int.self, forKey: .traitCount)
        maxValue = try container.decodeIfPresent(String.self, forKey: .maxValue)
        order = try container.decodeIfPresent(String.self, forKey: .order)
    }
}
