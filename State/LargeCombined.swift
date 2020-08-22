//
//  LargeCombined.swift
//  Tele2 Widget
//
//  Created by Anton Pushkin on 22.08.2020.
//

import WidgetKit
import SwiftUI

struct LargeCombined: View {
    var family : WidgetFamily
    var entry: LastLimitsEntry
    var body: some View {
        
        VStack(content: {
            Large(family: family, entry: entry)
                .padding(.top, 20)
                .padding(.horizontal, 20)
            Spacer()
            LargeBottom(family: family)
        })
        
    }
    func progressWidth() -> Float {
        switch family{
        case .systemSmall:
            return 3
        case .systemMedium:
            return 4
        default:
            return 12
        }
    }
    
    static func format(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy HH:mm"
        return formatter.string(from: date)
    }
}

struct LargeCombined_Previews: PreviewProvider {
    static var previews: some View {
        
        LargeCombined(family: .systemLarge, entry: exampleLastLimitsEntry)
            .previewContext(WidgetPreviewContext(family: .systemLarge))
            .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .center)
//            .padding()
            .background(Color(red: 0.10980392156862745, green: 0.10980392156862745, blue: 0.11764705882352941))
    }
}


