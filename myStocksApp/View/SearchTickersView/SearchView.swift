//
//  SearchView.swift
//  myStocksApp
//
//  Created by Григорий Ковалев on 13.02.2023.
//

import SwiftUI

struct SearchView: View {
    @StateObject var tickerVM = TickerViewModel()
    @ObservedObject var stocksVM: StocksViewModel
    
    @State private var searchTickerText = ""
    
    let layout = [GridItem(.adaptive(minimum: 200))]
        
    private var isThereInData: Bool {
        !tickerVM.tickers.filter({ $0.symbol.hasPrefix(searchTickerText) }).isEmpty
        
    }
    
    private var isThereOverlap: [TickerModel] {
        tickerVM.tickers.filter({ $0.symbol.hasPrefix(searchTickerText) })
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            if tickerVM.tickers.count < tickerVM.dataCount || tickerVM.tickers.count == 0 && tickerVM.dataCount == 0 {
            
                ProgressView()
                Spacer()
            } else {
                if searchTickerText.count > 0 {
                    VStack {
                        ScrollView {
                            LazyVGrid(columns: layout) {
                                if isThereInData {
                                    ForEach(isThereOverlap, id: \.symbol) { item in
                                        searchCellView(stocksVM: stocksVM, ticker: item)
                                    }
                                } else if searchTickerText.count > 0 {
                                    Text("This ticker is not in the database")
                                }
                            }
                        }
                    }
                    .padding(.top, 40)
                    .padding(.horizontal, 25)
                }
                Spacer()
                
                searchLineView(text: $searchTickerText)
            }
            
        }
        .interactiveDismissDisabled()
        .preferredColorScheme(.dark)
    }
}

//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchView()
//    }
//}
