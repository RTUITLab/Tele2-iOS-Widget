//
//  Large.swift
//  Tele2 Widget
//
//  Created by Anton Pushkin on 22.08.2020.
//

import WidgetKit
import SwiftUI

struct Large: View {
    var family : WidgetFamily
    var entry: Limits
    var giftIndicatorType: String
    var body: some View {
        
        VStack(alignment: .leading,spacing: 4) {
            HStack(content: {
                Text("")
                Spacer()
                GiftIndicator(type: giftIndicatorType)
            })
            HStack(alignment: .center,content: {
                VStack(alignment: .leading,content: {
                    Text("Номер")
                        .font(Font.custom("SF Ui Display", size: 12))
                        .foregroundColor(.white)
                        .allowsTightening(true)
                        .padding(.bottom, 4)
                        
                    Text(self.entry.phone)
                        .font(Font.custom("SF Ui Display", size: 14))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .allowsTightening(true)
                })
                .padding(.vertical, 5)
                Spacer()
                VStack(alignment: .leading,content: {
                    Text("Баланс")
                        .font(Font.custom("SF Ui Display", size: 12))
                            .foregroundColor(.white)
                        .allowsTightening(true)
                        .padding(.bottom, 4)
                    Text("\(self.entry.balance) ₽")
                        .font(Font.custom("SF Ui Display", size: 14))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .allowsTightening(true)
            
                })
            })
            
            VStack(alignment: .center,content: {
                Text("Остаток по тарифу «Мой разговор»:")
                    .font(Font.custom("SF Ui Display", size: 12))
                    .foregroundColor(.white)
                    .allowsTightening(true)
                    .multilineTextAlignment(.center)
                    .padding(.leading, 55.0)
                    .padding(.bottom, 5.0)
            })
            
            HStack(content: {
                Text("Звонки")
                    .font(Font.custom("SF Ui Display", size: 12))
                        .foregroundColor(.white)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .allowsTightening(true)
                Spacer()
                Text("\(self.entry.minutes.left)/\(self.entry.minutes.total) минут")
                    .font(Font.custom("SF Ui Display", size: 12))
                        .foregroundColor(.white)
                    .foregroundColor(.white)
                    .allowsTightening(true)
            })
            
            ProgressBarHorizontal(counter: self.entry.minutes.left, countTo: self.entry.minutes.total).frame(height: 4)
                .padding(.bottom, 5.0)
            HStack(content: {
                Text("Интернет")
                    .font(Font.custom("SF Ui Display", size: 12))
                        .foregroundColor(.white)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .allowsTightening(true)
                Spacer()
                Text("\(self.entry.data.left)/\(self.entry.data.total) Гб")
                    .font(Font.custom("SF Ui Display", size: 12))
                        .foregroundColor(.white)
                    .foregroundColor(.white)
                    .allowsTightening(true)
            })
            
            ProgressBarHorizontal(counter: self.entry.data.left, countTo: self.entry.data.total).frame(height: 4)
                .padding(.bottom, 5.0)
            
            HStack(content: {
                Text("Сообщения")
                    .font(Font.custom("SF Ui Display", size: 12))
                        .foregroundColor(.white)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .allowsTightening(true)
                Spacer()
                Text("\(self.entry.sms.left)/\(self.entry.sms.total) сообщений")
                    .font(Font.custom("SF Ui Display", size: 12))
                        .foregroundColor(.white)
                    .foregroundColor(.white)
                    .allowsTightening(true)
            })
            
            ProgressBarHorizontal(counter: self.entry.sms.left, countTo: self.entry.sms.total).frame(height: 4)
                .padding(.bottom, 5.0)
            
            //.aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            
            
            .padding(.bottom, 2.0)
        
            
        }
        
        
        
        
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

struct Large_Previews: PreviewProvider {
    static var previews: some View {
        
        Large(family: .systemLarge, entry: exampleLastLimitsEntry.entry.limits, giftIndicatorType: "weekly")
            .previewContext(WidgetPreviewContext(family: .systemLarge))
            .environment(\.sizeCategory, .extraLarge)
            .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .center)
            .padding()
            .background(Color(red: 0.10980392156862745, green: 0.10980392156862745, blue: 0.11764705882352941))
    }
}

