//
//  Currency.swift
//  CoinAPI
//
//  Created by eric hayes on 7/4/24.
//

import Foundation


struct Currency: Decodable, Hashable {
  
  var asset_id: String
  var name: String
  var price_usd: Double?
}
