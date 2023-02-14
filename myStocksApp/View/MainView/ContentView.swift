//
//  ContentView.swift
//  myStocksApp
//
//  Created by Григорий Ковалев on 13.02.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var stocksVM = StocksViewModel(range: .fiveYears)
    @State private var showingSheet = false
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView()
                
                if stocksVM.stocks.count < stocksVM.tickers.count {
                    
                    ProgressView()
                    
                } else {
                    StockSellView(stocksVM: stocksVM)
                        .scrollContentBackground(.hidden)
                }
            }
            .foregroundStyle(.white.opacity(0.7))
            .navigationTitle("Money don't sleep")
            .sheet(isPresented: $showingSheet) {
                SearchView(stocksVM: stocksVM)
            }
            
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    
                    Button {
                        showingSheet.toggle()
                    } label: {
                        Image(systemName: "sparkle.magnifyingglass")
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
