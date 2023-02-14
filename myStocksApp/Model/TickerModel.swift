//
//  TickerModel.swift
//  myStocksApp
//
//  Created by Григорий Ковалев on 13.02.2023.
//

import Foundation

struct TickerModel: Hashable {
    let symbol: String
    let name: String
    let type: String
    let exchangeName: String
    
    var openType: String {
        switch self.type {
        case "et":
            return "ETF"
        case "cs":
            return "stock"
        default:
            return "unknow"
        }
    }
    
    var openExchangeName: String {
        switch self.exchangeName {
        case "New York Stock Exchange Inc":
            return "NYSE"
        case "Nasdaq All Markets":
            return "Nasdaq"
        case "Nyse Mkt Llc":
            return "Nyse Mkt"
        default:
            return "unknow"
        }
    }
    
}
