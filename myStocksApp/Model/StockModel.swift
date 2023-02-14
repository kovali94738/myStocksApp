//
//  StockModel.swift
//  myStocksApp
//
//  Created by Григорий Ковалев on 13.02.2023.
//

import Foundation

struct StockModel: Hashable {
    let symbol: String
    let companyName: String
    let latestPrice: Double
    let change: Double
    
    let currentRange: APIRequest.AvailableRange
    let candles: [CGFloat]
    let closes: [Double]
}
