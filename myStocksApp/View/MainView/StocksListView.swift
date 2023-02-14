//
//  StocksListView.swift
//  myStocksApp
//
//  Created by Григорий Ковалев on 13.02.2023.
//

import SwiftUI

struct StockSellView: View {
    @ObservedObject var stocksVM: StocksViewModel
    
    var body: some View {
        List {
            Section {
                ForEach(stocksVM.tickers, id: \.self) { ticker in
                    
                    ForEach(stocksVM.stocks.filter({$0.symbol  == ticker}), id: \.self) { stock in
                        NavigationLink {
                            DetailView(stock: stock)
                            
                        } label: {
                            HStack {
                                Text(stock.companyName)
                                Spacer()
                                
                                VStack {
                                    Text("$\((String(format: "%.2f", stock.latestPrice)))")
                                        .padding(.bottom, 2)
                                    HStack {
                                        if stock.change > 0 {
                                            HStack {
                                                Text("$\(String(format: "%.2f", stock.change))")
                                                Text("▲")
                                            }
                                            .foregroundColor(.green)
                                        } else {
                                            HStack {
                                                Text("$\(String(format: "%.2f", stock.change))")
                                                Text("▼")
                                            }
                                            .foregroundColor(.red)
                                        }
                                    }
                                    .font(.footnote)
                                }
                            }
                        }
                    }
                }
                .listRowBackground(Color.black.opacity(0.3))
                
            } header: {
                if stocksVM.isOpen {
                    HStack {
                        Text("Stock exchange is open")
                        Image(systemName: "sun.max")
                            .foregroundColor(.yellow)
                            .font(.body)
                    }
                } else {
                    HStack {
                        Text("Stock exchange closed")
                        Image(systemName: "moon.zzz")
                            .foregroundColor(.blue)
                            .font(.body)
                    }
                }
            }
        }
    }
}
