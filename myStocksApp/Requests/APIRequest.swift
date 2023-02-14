//
//  APIRequest.swift
//  myStocksApp
//
//  Created by Григорий Ковалев on 13.02.2023.
//

import Foundation

class APIRequest {
    static let sample = APIRequest()
    
    private var url = "https://cloud.iexapis.com/v1/"
    private var token = "token=pk_577348cd4e694b79a0e7e14eebfbb6ca"
    
    public func getStocks(symbols: [String], handler: @escaping(_ returnedQuote: Stocks?) -> ()) {
        let query = "stock/market/batch?symbols=\(symbols.joined(separator: ","))&types=quote&"
        let url = URL(string: url + query + token)
        
        if let url = url {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("error getting quote: \(error)")
                    return
                }
                
                guard let stocksData = data else {
                    print("symbol search data not valid")
                    return
                }
                
                let returnedStocks = try? JSONDecoder().decode(Stocks.self, from: stocksData)
                
                handler(returnedStocks)
            }
            task.resume()
        }
    }
    
    public enum AvailableRange: String {
        case mounth = "1m"
        case threeMounhs = "3m"
        case sixMounths = "6m"
        case year = "1y"
        case twoYears = "2y"
        case fiveYears = "5y"
        
    }
    
    public func getCharts(symbol: String, range: AvailableRange, handler: @escaping(_ returnedCharts: Charts?) -> ()) {
        let query = "stock/\(symbol)/chart/\(range.rawValue)?"
        let url = URL(string: url + query + token)
        
        if let url = url {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("error getting quote: \(error)")
                    return
                }
                
                guard let chartsData = data else {
                    print("symbol search data not valid")
                    return
                }
                
                let returnedCharts = try? JSONDecoder().decode(Charts.self, from: chartsData)

                handler(returnedCharts)
            }
            task.resume()
        }
    }
    
    public func getTickers(handler: @escaping(_ returnedTickers: Tickers?) -> ()) {
        let query: String = "ref-data/symbols?"
        
        let url = URL(string: url + query + token)
        
        if let url = url {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("error searching for symbols: \(error)")
                    return
                } else {
                    guard let tickersData = data else {
                        print("symbol search not valid")
                        return
                    }
                    
                    let returnedTickers = try? JSONDecoder().decode(Tickers.self, from: tickersData)
                    handler(returnedTickers)
                }
            }
            task.resume()
        }
    }
    
}
