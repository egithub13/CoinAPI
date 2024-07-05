//
//  APIEndpoint.swift
//  CoinAPI
//
//  Created by eric hayes on 7/4/24.
//

import Foundation

enum APIEndpoint {
  
  //This base url is for list all assets
  static let baseURL = "https://rest.coinapi.io/v1/assets"
  
  //TODO - Create future cases for different queries. i.e symbols, exchanges, ect.
  
  static func endpointURL() throws -> URL {
    //Replace <Constants.Keys.apiKey> with your own personal API_KEY
    guard let url = URL(string: baseURL + Constants.Keys.apiKey) else {
      print("Invalid URL")
      throw CoinAPIError.invalidURL
    }
    return url
  }
  
}
