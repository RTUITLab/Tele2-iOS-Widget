//
//  MobileState.swift
//  Tele2 Widget
//
//  Created by Ivanov on 22.08.2020.
//

import WidgetKit
import SwiftUI

struct MobileState: View {
    var family : WidgetFamily
    var entry: Limits
    var giftIndicatorType: String;
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Spacer()

            HStack {
                
            
            Text(self.entry.phone)
                .font(Font.custom("SF Ui Display", size: 12))
                .foregroundColor(.white)
                .allowsTightening(true)
                .aspectRatio(contentMode: .fill)
                GiftIndicator(type: giftIndicatorType)
            }
            
            Spacer()
            
            HStack{
                Text("Баланс: ")
                    .font(Font.custom("SF Ui Display", size: 14))
                    .foregroundColor(.gray)
                   Spacer()
                Text("\(self.entry.balance) ₽")
                    .font(Font.custom("SF Ui Display", size: 16))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    
            }
            
                Text("До обновления 14 дней")
                    .font(Font.custom("SF Ui Display", size: 12))
                    .foregroundColor(.gray)
                    .padding(.vertical, 5.0)
            
            HStack(content: {
                VStack(spacing: 5, content: {
                    Text("Мин")
                        .font(Font.custom("SF Ui Display", size: 10))
                        .foregroundColor(Color.white)
                    ProgressBar(counter: self.entry.minutes.left, countTo: self.entry.minutes.total, width: progressWidth())
                })
                
                VStack(spacing: 5, content: {
                    Text("Гб")
                        .font(Font.custom("SF Ui Display", size: 10))
                        .foregroundColor(Color.white)
                    ProgressBar(counter: self.entry.data.left, countTo: self.entry.data.total, width: progressWidth())
                })
                
                VStack(spacing: 5, content: {
                    Text("SMS")
                        .font(Font.custom("SF Ui Display", size: 10))
                        .foregroundColor(Color.white)
                        .allowsTightening(true)
                    
                    
                    ProgressBar(counter: self.entry.sms.left, countTo: self.entry.sms.total, width: progressWidth())
                    
                })
                
                
                
            })
            .layoutPriority(1)
            .scaledToFill()
            Spacer()

            
        }
        .padding(5.0)

        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: 150, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: 150, alignment: .center)
        .widgetURL(URL(string: "realityshift///ad")!)
        
        
        
    }
    func progressWidth() -> Float {
        switch family{
        case .systemSmall:
            return 3
        case .systemMedium:
            return 3
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

struct MobileState_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MobileState( family: .systemSmall, entry: Limits(phone: "+7 (800) 555-35-35", balance: "145.20", minutes: Limit(total: 100,left: 50), data: Limit(total: 100, left: 50), sms: Limit(total: 100, left: 50)), giftIndicatorType: "offer")
                .background(Color(red: 0.10980392156862745, green: 0.10980392156862745, blue: 0.11764705882352941))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
                .environment(\.sizeCategory, .extraLarge)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
                
                
            
        }
    }
}
