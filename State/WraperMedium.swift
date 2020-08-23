//
//  WraperMedium.swift
//  Tele2 Widget
//
//  Created by Anton Pushkin on 23.08.2020.
//

import WidgetKit
import SwiftUI

struct WraperMedium: View {
    var body: some View {
        Circle()
        .fill(Color(red: 1.0, green: 0.34901960784313724, blue: 0.6392156862745098))
        .frame(width:9, height:9)
        .padding([.top, .leading])
            .position(x: 310, y: 8)
    }
}


struct WraperMedium_Previews: PreviewProvider {
    static var previews: some View {
        WraperMedium()
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .center)
            .padding()
            .background(Color(red: 0.10980392156862745, green: 0.10980392156862745, blue: 0.11764705882352941))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
            .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
        
    }
}

