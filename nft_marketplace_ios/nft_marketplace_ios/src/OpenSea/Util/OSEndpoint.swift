//
//  OSEndpoint.swift
//  nft_marketplace_ios
//
//  Created by Heriberto Prieto on 7/25/21.
//

import Foundation

/// Defines a unique path associated with api
public enum OSEndpoint: Endpoint {
    
    // MARK: - Endpoints
    
    /// /assets?order_direction=desc&offset=0&limit=20
    case assets(orderDirection: OrderDirection, offset: Int, limit: Int)
    
    public var urlString: String {
        "OpenSeaUrlString"
    }
    
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
        case .assets:
            path = "/assets"
        }
        
        return path
    }
    
    public var queryItems: [String: Any] {
        var queryItems: [String: Any] = [:]
        
        switch self {
        case .assets(let orderDirection, let offset, let limit):
            queryItems["order_direction"] = orderDirection.value
            queryItems["offset"] = "\(offset)"
            queryItems["limit"] = "\(limit)"
        }
        
        return queryItems
    }
    
    public var body: [String: Any]? {
        [:]
    }
}
