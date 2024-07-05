//
//  CurrencyClient.swift
//  CoinAPI
//
//  Created by eric hayes on 7/4/24.
//

import Foundation

enum CoinAPIError: Error {
  case invalidURL
  case invalidStatusCode
  case invalidDataDecode
  
}

struct CurrencyClient {
  
  func getAllAssets() async throws -> [Currency]? {

    let (data, response) = try await URLSession.shared.data(from: APIEndpoint.endpointURL())
    
    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
      print("Invalid Status Code")
      throw CoinAPIError.invalidStatusCode
    }
    
    do {
      let decoder = JSONDecoder()
      let currencies = try decoder.decode([Currency].self, from: data)
      return currencies
    } catch {
      print("Can't decode JSON")
      throw CoinAPIError.invalidDataDecode
    }
  }
}
