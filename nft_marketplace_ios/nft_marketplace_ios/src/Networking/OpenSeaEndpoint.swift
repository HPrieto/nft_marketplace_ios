//
//  OpenSeaEndpoint.swift
//  nft_marketplace_ios
//
//  Created by Heriberto Prieto on 7/20/21.
//

import Foundation

/// Defines a unique path associated with api
public enum OpenSeaEndpoint: Endpoint {
    
    // MARK: - Endpoints
    
    /// /assets?order_direction=desc&offset=0&limit=20
    case assets(orderDirection: String, offset: Int, limit: Int)
    
    public var httpMethod: HttpMethod {
        let httpMethod: HttpMethod
        
        switch self {
        case .assets:
            httpMethod = .get
        }
        
        return httpMethod
    }
    
    public var path: String {
        let path: String
        
        switch self {
        case .assets(let orderDirection, let offset, let limit):
            path = "/assets?order_direction=\(orderDirection)&offset=\(offset)&limit=\(limit)"
        }
        
        return path
    }
    
    public var queryItems: [String: Any]? {
        [:]
    }
    
    public var body: [String: Any]? {
        [:]
    }
}
