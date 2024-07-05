//
//  CurrencyRowView.swift
//  CoinAPI
//
//  Created by eric hayes on 7/5/24.
//

import SwiftUI

struct CurrencyRowView: View {
  
   var currency: Currency
  
    var body: some View {
      HStack(alignment: .top) {
        VStack(alignment: .leading) {
          Text(currency.name)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .font(.title2)
          Text(currency.asset_id)
        }
        Spacer()
        Text("$" + String(format: "%.2f", currency.price_usd ?? 0.00))
          .fontWeight(.regular)
          .font(.callout)
          .foregroundColor(.primary)
      }
    }
}

#Preview {
  CurrencyRowView(currency: Currency(asset_id: "BTC", name: "Bitcoin", price_usd: 59178.20))
}
