//
//  LineChart.swift
//  myStocksApp
//
//  Created by Григорий Ковалев on 13.02.2023.
//

import SwiftUI


struct LineChart: Shape {
    
    //нормализованные Y значения
    var data: [CGFloat]
    
    func path(in rect: CGRect) -> Path {
        
        func convertToPoint(index: Int) -> CGPoint {
            let point = data[index]
            
            //точка по x
            let x = rect.width *  CGFloat(index) / CGFloat(data.count)
            //точка по y
            //отнимаем единицу чтобы перевернуть график потому что Core Graphics начало кординат слева вверху
            let y = (1-point) * rect.height
            
            return CGPoint(x: x, y: y)
        }
        
        return Path { p in
            if data.count < 2 {
               return
            }
            
            let start = data.first
            
            
            p.move(to: CGPoint(x: 0, y: (1 - (start ?? 0.0)) * rect.height))
            
            for index in data.indices {
                p.addLine(to: convertToPoint(index: index))
            }
        }
    }
}



struct StockMockData {
    static let apple: [CGFloat] = [
        148.58, 144.35, 147.03, 146.89, 147.83, 149.89, 149.07, 145.38, 137.38, 138.42, 140.80, 137.78, 139.08, 139.88, 146.85
    ]
}



struct LineChart_Previews: PreviewProvider {
    static var previews: some View {
        LineChart(data: StockMockData.apple.normalizedValues)
            .stroke(Color.green)
            .frame(width: 400, height: 500)
            .padding()
    }
}
