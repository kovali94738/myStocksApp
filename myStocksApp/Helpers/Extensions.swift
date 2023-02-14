//
//  Extensions.swift
//  myStocksApp
//
//  Created by Григорий Ковалев on 13.02.2023.
//

import Foundation
import SwiftUI

extension Array where Element == CGFloat {
    
    var normalizedValues: [CGFloat] {
        
        if let min = self.min(), let max = self.max() {
            return self.map({($0 - min)/(max-min) })
        }
        
        return []
        
        
    }
    
}


extension Color {
    static func random() -> Color {
        return Color(red: .random(in: 0...1),
                     green: .random(in: 0...1),
                     blue: .random(in: 0...1))
    }
}
