//
//  OSOwner.swift
//  nft_marketplace_ios
//
//  Created by Heriberto Prieto on 7/25/21.
//

import Foundation

struct OSOwner: Codable {
    public var username: String?
    
    private enum CodingKeys: String, CodingKey {
        case username = "username"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        username = try container.decodeIfPresent(String.self, forKey: .username)
    }
}
