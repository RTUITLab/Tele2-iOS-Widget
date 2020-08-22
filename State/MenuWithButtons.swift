//
//  MenuWithButtons.swift
//  Tele2 Widget
//
//  Created by Anton Pushkin on 22.08.2020.
//

import WidgetKit
import SwiftUI

struct MenuWithButtons: View {
    var body: some View {
        HStack {
            VStack(alignment: .center){
                ZStack(content: {
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: 138, height: 25)
                        .cornerRadius(12.5)
                    Rectangle()
                        .fill(Color(red: 28 / 255, green: 28 / 255, blue: 30 / 255))
                        .frame(width: 133, height: 20)
                        .cornerRadius(10)
                    Text("Пополнить счет")
                        .font(Font.custom("SF Ui Display", size: 11))
                        .foregroundColor(.white)
                        .bold()
                })
                .padding(.vertical, 2)
                ZStack(content: {
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: 138, height: 25)
                        .cornerRadius(12.5)
                    Rectangle()
                        .fill(Color(red: 28 / 255, green: 28 / 255, blue: 30 / 255))
                        .frame(width: 133, height: 20)
                        .cornerRadius(10)
                    Text("Купить")
                        .font(Font.custom("SF Ui Display", size: 11))
                        .foregroundColor(.white)
                        .bold()
                })
                .padding(.vertical, 2)
                ZStack(content: {
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: 138, height: 25)
                        .cornerRadius(12.5)
                    Rectangle()
                        .fill(Color(red: 28 / 255, green: 28 / 255, blue: 30 / 255))
                        .frame(width: 133, height: 20)
                        .cornerRadius(10)
                    Text("Продать")
                        .font(Font.custom("SF Ui Display", size: 11))
                        .foregroundColor(.white)
                        .bold()
                })
                .padding(.vertical, 2)
            }
        }
        
    }
}

struct MenuWithButtons_Previews: PreviewProvider {
    static var previews: some View {
        MenuWithButtons()
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .center)
            .padding()
            .background(Color(red: 0.10980392156862745, green: 0.10980392156862745, blue: 0.11764705882352941))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
            .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
        
    }
}

