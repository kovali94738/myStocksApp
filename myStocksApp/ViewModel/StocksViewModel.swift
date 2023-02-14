//
//  StocksViewModel.swift
//  myStocksApp
//
//  Created by Григорий Ковалев on 13.02.2023.
//

import Foundation

class StocksViewModel: ObservableObject {
    
    var tickers = ["AAPL", "NVDA", "NFLX", "META", "T", "KO", "COIN", "OXY", "TSM", "SPY", "AMZN", "AMD", "MSFT", "INTC"]

    let range: APIRequest.AvailableRange
    
    @Published var stocks = [StockModel]()
    
    var currentRange: APIRequest.AvailableRange {
        range
    }
    
    init(range: APIRequest.AvailableRange) {
        self.range = range
        self.fetchStockData()
    }
    
    
    public func fetchStockData() {
        
        APIRequest.sample.getStocks(symbols: tickers) { returnedQuote in
            for ticker in self.tickers {
                APIRequest.sample.getCharts(symbol: ticker, range: self.range) { returnedCharts in
                    
                    guard let charts = returnedCharts else { return }
                    
                    let candleArray: [CGFloat] = charts.map { chart in
                        guard let close = chart.close else { return 0 }
                        return CGFloat(close)
                    }
                    
                    let closesArray: [Double] = charts.map { chart in
                        guard let close = chart.close else { return 0 }
                        return Double(close)
                    }
                    
                    let newStock = StockModel(symbol: ticker, companyName: returnedQuote![ticker]?.quote.companyName ?? "", latestPrice: returnedQuote![ticker]?.quote.latestPrice ?? 0, change: returnedQuote![ticker]?.quote.change ?? 0, currentRange: self.currentRange, candles: candleArray, closes: closesArray)
                    
                    DispatchQueue.main.async {
                        self.stocks.append(newStock)
                    }
                    
                }
            }
        }
    }
    var isOpen: Bool {
        let date = Date()
        var calendar = Calendar.current
        let timeZone = TimeZone(abbreviation: "EST")!
        calendar.timeZone = timeZone
        let components = calendar.dateComponents([.hour, .minute, .weekday], from: date)
        let currentHour = components.hour!
        let currentMinute = components.minute!
        let currentWeekday = components.weekday!
        
        if (currentWeekday == 7 || currentWeekday == 1) {
            return false
        } else if (currentHour == 9 && currentMinute >= 30) || (currentHour >= 10 && currentHour <= 15) || (currentHour == 16 && currentMinute == 0) {
            return true
        } else {
            return false
        }
        
    }
}
