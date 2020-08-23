//
//  WraperMedium.swift
//  Tele2 Widget
//
//  Created by Anton Pushkin on 23.08.2020.
//

import WidgetKit
import SwiftUI

struct WraperMedium: View {
    var limits: Limits
    var widgetSettings: WidgetSettings
    var offer: String
    var body: some View {
        HStack(spacing: 30) {
            WraperSmall(limits: limits, widgetSettings: WidgetSettings(smallType: widgetSettings.mediumLeftType, mediumLeftType: "", mediumRightType: ""), family: .systemMedium, giftIndicatorType: "disabled")
            
            WraperSmall(limits: limits, widgetSettings: WidgetSettings(smallType: widgetSettings.mediumRightType, mediumLeftType: "", mediumRightType: ""), family: .systemMedium, giftIndicatorType: offer)
        }
    }
}


struct WraperMedium_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            WraperMedium(limits: exampleLastLimitsEntry.entry.limits, widgetSettings: WidgetSettings(smallType: "", mediumLeftType: "ad", mediumRightType: "quick"), offer: "weekly")
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .center)
                .padding()
                .background(Color(red: 0.10980392156862745, green: 0.10980392156862745, blue: 0.11764705882352941))
                .previewContext(WidgetPreviewContext(family: .systemMedium))
                .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
            
            
            WraperMedium(limits: exampleLastLimitsEntry.entry.limits, widgetSettings: WidgetSettings(smallType: "",
                                                                                                     mediumLeftType: "offer", mediumRightType: "ad"), offer: "weekly")
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .center)
                .padding()
                .background(Color(red: 0.10980392156862745, green: 0.10980392156862745, blue: 0.11764705882352941))
                .previewContext(WidgetPreviewContext(family: .systemMedium))
                .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
        }
    }
}

