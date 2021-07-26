//
//  OSCreator.swift
//  nft_marketplace_ios
//
//  Created by Heriberto Prieto on 7/25/21.
//

import Foundation

struct OSCreator: Codable {
    public var user: OSOwner?
    public var profileImageUrl: String?
    public var address: String?
    public var config: String?
    public var discordId: String?
    
    private enum CodingKeys: String, CodingKey {
        case user = "user"
        case profileImageUrl = "profile_image_url"
        case address = "address"
        case config = "config"
        case discordId = "discord_id"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        user = try container.decodeIfPresent(OSOwner.self, forKey: .user)
        profileImageUrl = try container.decodeIfPresent(String.self, forKey: .profileImageUrl)
        address = try container.decodeIfPresent(String.self, forKey: .address)
        config = try container.decodeIfPresent(String.self, forKey: .config)
        discordId = try container.decodeIfPresent(String.self, forKey: .discordId)
    }
}
