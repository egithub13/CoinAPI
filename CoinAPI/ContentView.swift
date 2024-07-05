//
//  ContentView.swift
//  CoinAPI
//
//  Created by eric hayes on 7/4/24.
//

import SwiftUI

struct ContentView: View {
  
  @State private var currency: [Currency]?
  let client = CurrencyClient()
  
  private func getData() async {
    do {
      currency = try await client.getAllAssets()
    } catch CoinAPIError.invalidURL {
      print("Invalid URL")
    } catch CoinAPIError.invalidStatusCode {
      print("Invalid status code")
    } catch CoinAPIError.invalidDataDecode {
      print("Invalid decoding")
    } catch {
      print("Unknown Error")
    }
  }
  
  var body: some View {
    VStack {
      if let data = currency {
        NavigationView {
          List(data, id: \.self) { currency in
            CurrencyRowView(currency: currency)
          }
          .navigationTitle("Currencies")
        }
      } else {
        Text("Retriving currencies..")
      }
    }
    .task {
      await getData()
    }
  }
}



#Preview {
  ContentView()
}
