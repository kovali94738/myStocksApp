//
//  JSONDecoders.swift
//  myStocksApp
//
//  Created by Григорий Ковалев on 13.02.2023.
//

import Foundation

//данные о акции
typealias Stocks = [String: Quote]

struct Quote: Codable {
    let quote: Stock
}

struct Stock: Codable {
    let avgTotalVolume: Double?
    let calculationPrice: String?
    let change: Double?
    let changePercent: Double?
    let close: Double?
    let closeSource: String?
    let closeTime: Double?
    let companyName: String?
    let currency: String?
    let delayedPrice: Double?
    let delayedPriceTime: Double?
    let extendedChange: Double?
    let extendedChangePercent: Double?
    let extendedPrice: Double?
    let extendedPriceTime: Double?
    let high: Double?
    let highSource: String?
    let highTime: Double?
    let iexAskPrice: Double?
    let iexAskSize: Double?
    let iexBidPrice: Double?
    let iexBidSize: Double?
    let iexClose: Double?
    let iexCloseTime: Double?
    let iexLastUpdated: Double?
    let iexMarketPercent: Double?
    let iexOpen: Double?
    let iexOpenTime: Double?
    let iexRealtimePrice: Double?
    let iexRealtimeSize: Double?
    let iexVolume: Double?
    let lastTradeTime: Double?
    let latestPrice: Double?
    let latestSource: String?
    let latestTime: String?
    let latestUpdate: Double?
    let latestVolume: Double?
    let low: Double?
    let lowSource: String?
    let lowTime: Double?
    let marketCap: Double?
    let oddLotDelayedPrice: Double?
    let oddLotDelayedPriceTime: Double?
    let open: Double?
    let openTime: Double?
    let openSource: String?
    let peRatio: Double?
    let previousClose: Double?
    let previousVolume: Double?
    let primaryExchange: String?
    let symbol: String?
    let volume: Double?
    let week52High: Double?
    let week52Low: Double?
    let ytdChange: Double?
    let isUSMarketOpen: Bool?
}

//данные о всех котировок api

typealias Tickers = [Ticker]

struct Ticker: Codable {
    let symbol: String?
    let exchange: String?
    let exchangeSuffix: String?
    let exchangeName: String?
    let exchangeSegment: String?
    let exchangeSegmentName: String?
    let name: String?
    let date: String?
    let type: String?
    let iexId: String?
    let region: String?
    let currency: String?
    let isEnabled: Bool?
    let figi: String?
    let cik: String?
    let lei: String?
        
}

//исторические данные цен котировки

typealias Charts = [Chart]

struct Chart: Codable {
    let close: Double?
}
