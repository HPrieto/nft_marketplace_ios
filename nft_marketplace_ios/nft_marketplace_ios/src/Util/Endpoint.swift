//
//  Endpoint.swift
//  nft_marketplace_ios
//
//  Created by Heriberto Prieto on 7/20/21.
//

import Foundation

protocol Endpoint {
    /// Request Method Type
    var httpMethod: HttpMethod { get }
    /// API Endpoint Path
    var path: String { get }
    /// URL Encoded Query Parameters (i.e. ?)
    var queryItems: [String : Any]? { get }
    /// JSON Encoded Body
    var body: [String: Any]? { get }
}

extension Endpoint {
    
    /**
     Build URLRequest
     */
    func urlRequest(using baseURL: URL) throws -> URLRequest {
        let url: URL = baseURL.appendingPathComponent(path)
        var request: URLRequest = URLRequest(url: url)
        request.httpMethod = httpMethod.name
        
        if let body = self.body,
           let jsonData = JSON.data(from: body) {
            request.httpBody = jsonData
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            print("HttpBody: ", String(data: jsonData, encoding: .utf8) ?? "None.")
        }
        
        return request
    }
}
