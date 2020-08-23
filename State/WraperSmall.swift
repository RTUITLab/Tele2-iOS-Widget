//
//  WraperSmall.swift
//  Tele2 Widget
//
//  Created by Anton Pushkin on 23.08.2020.
//

import WidgetKit
import SwiftUI

struct WraperSmall: View {
    var limits: Limits
    var widgetSettings: WidgetSettings
    var family: WidgetFamily
    var body: some View {
        ZStack {
            
            
            switch widgetSettings.smallType{
            case "ad":
                MobileState(family: family, entry: self.limits, giftIndicatorType: "weekly")
                
            case "quick":
                MenuWithButtons()
                
            default:
                
                Text("incorrect state setting")
            }
        }
    }
}


struct WraperSmall_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WraperSmall(limits: exampleLastLimitsEntry.entry.limits, widgetSettings: WidgetSettings(smallType: "ad", mediumLeftType: "", mediumRightType: ""), family: .systemSmall)
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .center)
                .padding()
                .background(Color(red: 0.10980392156862745, green: 0.10980392156862745, blue: 0.11764705882352941))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
                .environment(\.sizeCategory, .extraLarge)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
            
            WraperSmall(limits: exampleLastLimitsEntry.entry.limits, widgetSettings: WidgetSettings(smallType: "quick", mediumLeftType: "", mediumRightType: ""), family: .systemSmall)
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .center)
                .padding()
                .background(Color(red: 0.10980392156862745, green: 0.10980392156862745, blue: 0.11764705882352941))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
                .environment(\.sizeCategory, .extraLarge)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
        }
        
    }
}
