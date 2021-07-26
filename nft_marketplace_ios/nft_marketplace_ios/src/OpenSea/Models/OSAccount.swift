//
//  OSAccount.swift
//  nft_marketplace_ios
//
//  Created by Heriberto Prieto on 7/25/21.
//

import Foundation

struct OSAccount: Codable {
    public var address: String?
    public var profileImageUrl: String?
    public var user: OSUser?
    public var config: String?
    
    private enum CodingKeys: String, CodingKey {
        case address = "address"
        case profileImageUrl = "profile_img_url"
        case user = "user"
        case config = "config"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        address = try container.decodeIfPresent(String.self, forKey: .address)
        profileImageUrl = try container.decodeIfPresent(String.self, forKey: .profileImageUrl)
        user = try container.decodeIfPresent(OSUser.self, forKey: .user)
        config = try container.decodeIfPresent(String.self, forKey: .config)
    }
}
