//
//  TickersViewModel.swift
//  myStocksApp
//
//  Created by Григорий Ковалев on 13.02.2023.
//

import Foundation

class TickerViewModel: ObservableObject {
    
     @Published var tickers = [TickerModel]()
    
    var dataCount = 0
    
    init() {
        self.fetchStockData()
    }
    
    public func fetchStockData() {
        APIRequest.sample.getTickers { returnedTickers in
            self.dataCount = returnedTickers?.count ?? 0
            for ticker in returnedTickers! {
                DispatchQueue.main.async {
                    self.tickers.append(TickerModel(symbol: ticker.symbol ?? "", name: ticker.name ?? "", type: ticker.type ?? "", exchangeName: ticker.exchangeName ?? ""))
                }
            }
        }
    }
}
