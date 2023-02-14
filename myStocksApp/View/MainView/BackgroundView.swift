//
//  BackgroundView.swift
//  myStocksApp
//
//  Created by Григорий Ковалев on 13.02.2023.
//

import SwiftUI

struct BackgroundView: View {
    @State private var backgroundColor = Color.random()
    var body: some View {
        ZStack {
            Color.black
            
            backgroundColor
                .opacity(0.7)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 14, repeats: true) { Timer in
                withAnimation(.linear(duration: 7).repeatForever()) {
                    self.backgroundColor = Color.random()
                }
            }
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
