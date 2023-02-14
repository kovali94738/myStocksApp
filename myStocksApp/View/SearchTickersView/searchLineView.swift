//
//  searchLineView.swift
//  myStocksApp
//
//  Created by Григорий Ковалев on 13.02.2023.
//

import SwiftUI

struct customViewModifier: ViewModifier {
    var roundedCornes: CGFloat
    var startColor: Color
    var endColor: Color
    var textColor: Color
    
    func body(content: Content) -> some View {
        content
            .padding(.vertical, 3)
            .background(LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(roundedCornes)
            .padding(5)
            .foregroundColor(textColor)
            .overlay(RoundedRectangle(cornerRadius: roundedCornes)
                .stroke(LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 3))
            .font(.custom("Open Sans", size: 18))
        
            .shadow(radius: 10)
    }
}

struct searchLineView: View {
    @Binding var text: String
    var body: some View {
        HStack {
            Image(systemName: "sparkle.magnifyingglass")
                .padding(.leading, 5)
            TextField("Search...", text: $text)
                .keyboardType(.asciiCapable)
                .autocapitalization(.allCharacters)
        }
        .modifier(customViewModifier(roundedCornes: 6, startColor: .orange, endColor: .purple, textColor: .white))
        .padding(.horizontal, 20)
        .padding(.bottom, 5)
        .padding(.top, 5)
    }
}
