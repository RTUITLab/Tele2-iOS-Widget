//
//  GiftIndicator.swift
//  Tele2 Widget
//
//  Created by student on 23.08.2020.
//

import SwiftUI



struct GiftIndicator: View {
    var type: String
    var body: some View {
        Circle()
            .fill(getColorForType())

            .frame(width:9, height:9)
    }
    
    func getColorForType() -> Color {
        switch self.type {
        case "weekly":
            return Color.yellow
        case "offer":
            return Color(red: 1.0, green: 0.34901960784313724, blue: 0.6392156862745098)
        default:
            return Color.gray
        }
    }
}

struct GiftIndicator_Previews: PreviewProvider {
    static var previews: some View {
        GiftIndicator(type: "offer")
    }
}
