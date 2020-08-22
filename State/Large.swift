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
    var entry: LastLimitsEntry
    var body: some View {
        
        VStack(alignment: .leading,spacing: 4) {
            
            HStack(content: {
                VStack(content: {
                    Image("logoT2")
                })
                Spacer()
                VStack(content: {
                    Image("gift")
                })
            })
            .padding(.bottom, 10.0)
            
            HStack(alignment: .center,content: {
                VStack(alignment: .leading,content: {
                    Text("Номер")
                        .font(Font.custom("Tele2 DisplaySerif Web SHORT", size: 22))
                        .bold()
                        .foregroundColor(.white)
                        .allowsTightening(true)
                    Text(self.entry.limits.phone)
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .allowsTightening(true)
                })
                .padding(.trailing, 40)
                .padding(.vertical, 5)
                VStack(alignment: .leading,content: {
                    Text("Баланс")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .allowsTightening(true)
                    Text("\(self.entry.limits.balance) ₽")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .allowsTightening(true)
            
                })
            })
            
            VStack(alignment: .leading,content: {
                Text("Остаток по тарифу «Мой разговор»:")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .allowsTightening(true)
            })
            
            HStack(content: {
                Text("Звонки")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .allowsTightening(true)
                Spacer()
                Text("\(self.entry.limits.minutes.left)/\(self.entry.limits.minutes.total) минут")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .allowsTightening(true)
            })
            
            ProgressBarHorizontal(counter: self.entry.limits.minutes.left, countTo: self.entry.limits.minutes.total).frame(height: 4)
                        
            HStack(content: {
                Text("Интернет")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .allowsTightening(true)
                Spacer()
                Text("\(self.entry.limits.data.left)/\(self.entry.limits.data.total) Гб")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .allowsTightening(true)
            })
            
            ProgressBarHorizontal(counter: self.entry.limits.data.left, countTo: self.entry.limits.data.total).frame(height: 4)
            
            HStack(content: {
                Text("Сообщения")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .allowsTightening(true)
                Spacer()
                Text("\(self.entry.limits.sms.left)/\(self.entry.limits.sms.total) сообщений")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .allowsTightening(true)
            })
            
            ProgressBarHorizontal(counter: self.entry.limits.sms.left, countTo: self.entry.limits.sms.total).frame(height: 4)
            
            
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
        
        Large(family: .systemLarge, entry: exampleLastLimitsEntry)
            .previewContext(WidgetPreviewContext(family: .systemLarge))
            .environment(\.sizeCategory, .extraLarge)
            .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .center)
            .padding()
            .background(Color(red: 0.10980392156862745, green: 0.10980392156862745, blue: 0.11764705882352941))
    }
}

