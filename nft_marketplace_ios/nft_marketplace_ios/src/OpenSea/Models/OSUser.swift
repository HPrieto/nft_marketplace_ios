//
//  OSUser.swift
//  nft_marketplace_ios
//
//  Created by Heriberto Prieto on 7/26/21.
//

import Foundation

struct OSUser: Codable {
    public var username: String?
    
    private enum CodingKeys: String, CodingKey {
        case username = "username"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        username = try container.decodeIfPresent(String.self, forKey: .username)
    }
}
