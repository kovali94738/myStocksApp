//
//  DetailView.swift
//  myStocksApp
//
//  Created by Григорий Ковалев on 13.02.2023.
//

import SwiftUI

struct DetailView: View {
    let stock: StockModel
    
    var isGreen: Bool {
        if Double(stock.candles.first!) > Double(stock.candles.last!) {
            return false
        } else {
            return true
        }
    }
    
    var priceDifference: String {
        let i = stock.closes.last! - stock.closes.first!
        return String(format: "%.2f", i)
    }
    
    var percentageDifference: String {
        let i = ((stock.closes.last! / stock.closes.first!) - 1) * 100
        return String(format: "%.2f", i)
    }
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 15) {
                    Text(stock.companyName)
                        .bold()
                        .font(.largeTitle)
                        .lineLimit(1)
                    Text(stock.symbol)
                    Divider()
                }
                Spacer()
                VStack(alignment: .center, spacing: 15) {
                    Text("$\(stock.latestPrice.formatted())")
                }
                .padding(.trailing)

            }
            Spacer()
            GeometryReader { geo in
                ScrollView {
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .fill(.ultraThinMaterial)
                        LineChart(data: stock.candles.normalizedValues)
                            .stroke(isGreen ? Color.green : Color.red, lineWidth: 2)
                            .padding()
                    }
                        .frame(width: geo.size.width * 0.99, height: geo.size.height * 0.85)
                    .frame(width: geo.size.width, height: geo.size.height)
                    
                    Text("Разница в цене за \(stock.currentRange.rawValue): $\(priceDifference) или \(percentageDifference)%")
                    
                }
            }
            Spacer()
        }
    }
}




//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView(stock: StockModel(symbol: "AAPL", companyName: "AAPL", latestPrice: 150, change: 3, candles: StockMockData.apple.normalizedValues, closes: StockMockData))
//    }
//}
