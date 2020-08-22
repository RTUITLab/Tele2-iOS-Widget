//
//  QrView.swift
//  Tele2 Widget
//
//  Created by Student on 22.08.2020.
//

import SwiftUI
import WidgetKit

struct QrView: View {
    var body: some View {
        VStack {
            Image("qr_code")
                .resizable()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text("Покажите QR-код ")
                .font(.caption2)
            +
            Text("на кассе")
                .foregroundColor(Color(red: 1.0, green: 0.34901960784313724, blue: 0.6392156862745098))
                .font(.caption2)
            +
            Text(", чтобы использовать купон")
                .font(.caption2)
            

        }
        .foregroundColor(.white)
    }
}

struct QrView_Previews: PreviewProvider {
    static var previews: some View {
        QrView()
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .center)
            .background(Color(red: 0.10980392156862745, green: 0.10980392156862745, blue: 0.11764705882352941))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
            .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
            .previewDisplayName("Small")
        
    }
}
