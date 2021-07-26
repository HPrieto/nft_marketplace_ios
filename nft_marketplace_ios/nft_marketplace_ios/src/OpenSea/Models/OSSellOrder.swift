//
//  OSSellOrder.swift
//  nft_marketplace_ios
//
//  Created by Heriberto Prieto on 7/25/21.
//

import Foundation

//struct OSSellOrder: Codable {
//    public var createdDate: Date?
//    public var closingDate: Date?
//    public var closingExtendable: Bool?
//    public var expirationTime: Double?
//    public var listingTime: Double?
//    public var orderHash: String?
//    public var exchange: String?
//    public var currentPrice: String?
//    public var currentBounty: String?
//    public var bountyMultiple: String?
//    public var makerRelayerFee: String?
//    public var makerProtocolFee: String?
//    public var takerProtocolFee: String?
//    public var makerReferrerFee: String?
//    public var feeMethod: Int?
//    public var side: Int?
//    public var saleKind: Int?
//    public var target: String?
//    public var howToCall: Int?
//    public var callData: String?
//    public var replacementPattern: String?
//    public var staticTarget: String?
//    public var staticExtradata: String?
//    public var paymentToken: String?
//    public var basePrice: String?
//    public var extra: String?
//    public var quanitity: String?
//    public var salt: String?
//    public var v: Int?
//    public var r: String?
//    public var s: String?
//    public var approvedOnChain: Bool?
//    public var cancelled: Bool?
//    public var finalized: Bool?
//    public var markedInvalid: Bool?
//    public var prefixedHash: String?
//
//    private enum CodingKeys: String, CodingKey {
//        case createdDate = "created_date"
//        case closingDate = "closing_date"
//        case closingExtendable = "closingExtendable"
//        case expirationTime = "expiration_time"
//        case listingTime = "listing_time"
//        case orderHash = "order_hash"
//        case exchange = "exchange"
//        case currentPrice = "current_price"
//        case currentBounty = "current_bounty"
//        case bountyMultiple = "bounty_multiple"
//        case makerRelayerFee = "maker_relayer_fee"
//        case makerProtocolFee = "maker_protocol_fee"
//        case takerProtocolFee = "taker_protocol_fee"
//        case makerReferrerFee = "maker_referrer_fee"
//        case feeMethod = "fee_method"
//        case side = "side"
//        case saleKind = "sale_kind"
//        case target = "target"
//        case howToCall = "how_to_call"
//        case callData = "call_data"
//        case replacementPattern = "replacement_pattern"
//        case staticTarget = "static_target"
//        case staticExtradata = "static_extradata"
//        case paymentToken = "payment_token"
//        case basePrice = "base_price"
//        case extra = "extra"
//        case quantity = "quantity"
//    }
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        closingExtendable = try container.decodeIfPresent(Bool.self, forKey: .closingExtendable)
//    }
//}
