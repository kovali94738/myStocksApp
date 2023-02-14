//
//  searchCellView.swift
//  myStocksApp
//
//  Created by Григорий Ковалев on 13.02.2023.
//

import SwiftUI

struct searchCellView: View {
    @ObservedObject var stocksVM: StocksViewModel
    let ticker: TickerModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
        HStack {
            
            VStack(alignment: .leading, spacing: 10) {
                Text(ticker.symbol)
                    .font(.headline)
                Text(ticker.name)
                    .font(.callout)
                    .lineLimit(1)
            }
            .padding(.leading)
            
            Spacer()
            
            VStack(alignment: .trailing) {
                VStack(alignment: .center, spacing: 10) {
                    Text(ticker.openExchangeName)
                        .font(.headline)
                    Text(ticker.openType)
                        .font(.callout)
                }
            }
            .padding(.trailing)
            
            VStack {
                if !(stocksVM.stocks.contains(where: { $0.symbol == ticker.symbol })) {
                    Image(systemName: "star")

                } else {
                    Image(systemName: "star.fill")
                        .foregroundColor(Color.yellow)
                }
            }
            .font(.title)
            .padding(.trailing)
            .onTapGesture {
                dismiss()
            }
        }
        
        .foregroundColor(.white)
        .padding(.vertical)
        .background {
            RoundedRectangle(cornerRadius: 15)
                .fill(.white.opacity(0.3))
        }
    }
}
