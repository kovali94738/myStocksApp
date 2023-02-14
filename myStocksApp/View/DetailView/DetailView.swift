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
    
    var maxPrice: String {
        let i = stock.closes.max()!.formatted()
        return i
    }
    
    var minPrice: String {
        let i = stock.closes.min()!.formatted()
        return i
    }
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 15) {
                        Text(stock.companyName)
                            .bold()
                            .font(.headline)
                            
                        Text(stock.symbol)
                    }
                    Spacer()
                    VStack(alignment: .center, spacing: 15) {
                        Text("$\(stock.latestPrice.formatted())")
                    }
                    .padding(.trailing)

                }
                
                Divider()
                
                Spacer()

                Text("Разница в цене за \(stock.currentRange.rawValue): $\(priceDifference) или \(percentageDifference)%")
                    .padding(.vertical)
                ScrollView {
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)

                            .fill(.ultraThinMaterial)
                        LineChart(data: stock.candles.normalizedValues)
                            .stroke(isGreen ? Color.green : Color.red, lineWidth: 2)
                            .padding()
                    }
                    .frame(width: geo.size.width * 0.95, height: geo.size.height * 0.5)
                    Text("Максимальная цена за \(stock.currentRange.rawValue): $\(maxPrice)")
                        .padding(.vertical)
                    Text("Минимальная цена за \(stock.currentRange.rawValue): $\(minPrice)")
                    
                }
                .frame(width: geo.size.width)
                Spacer()
            }
        }
    }
}




//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView(stock: StockModel(symbol: "AAPL", companyName: "AAPL", latestPrice: 150, change: 3, candles: StockMockData.apple.normalizedValues, closes: StockMockData))
//    }
//}
