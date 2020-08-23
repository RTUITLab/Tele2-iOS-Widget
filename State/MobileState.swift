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
    
    var body: some View {
        VStack(alignment: .center, spacing: 4) {
            
            HStack(content: {
                VStack(content: {
                    Text(self.entry.phone)
                        .font(Font.custom("SF Ui Display", size: 10))
                        .foregroundColor(.white)
                        .padding(.trailing, 32.0)
                        .allowsTightening(true)
                        
                    //                        .resizable()
                    //                        .frame(width: 53, height: 20)
                })
                //                .frame(width: 50, height: 20, alignment: .bottom)
               
             
            })
            .padding(.bottom, 10.0)
            
            .aspectRatio(contentMode: .fill)
            
            
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content: {
                HStack{
                Text("Баланс: ")
                    .font(Font.custom("SF Ui Display", size: 11))
                    .foregroundColor(.gray)
                    .padding([.bottom, .trailing])
                    Text("\(self.entry.balance) ₽")
                    .font(Font.custom("SF Ui Display", size: 11))
                    .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.bottom)
                        .padding(.trailing, 7.0)
                }
                .padding(.bottom, -9.0)
                Text("До обновления 14 дней")
                    .font(Font.custom("SF Ui Display", size: 11))
                    .foregroundColor(.gray)
                    .padding(.bottom, -3.0)
            
            })
                
            .padding(.bottom, 5.0)
            
            
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
            
            
        }
        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .center)
        .padding()
        
        
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
            MobileState( family: .systemSmall, entry: exampleLastLimitsEntry.entry.limits)
                .previewContext(WidgetPreviewContext(family: .systemSmall))
                .environment(\.sizeCategory, .extraLarge)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
                
                .background(Color(red: 0.10980392156862745, green: 0.10980392156862745, blue: 0.11764705882352941))
            
            HStack(alignment: .center){
                MobileState(family: .systemMedium, entry: exampleLastLimitsEntry.entry.limits)
                ShopAd()
            }
            
            .background(Color(red: 0.10980392156862745, green: 0.10980392156862745, blue: 0.11764705882352941))
            .environment(\.sizeCategory, .extraLarge)
            .previewContext(WidgetPreviewContext(family: .systemMedium))
            .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
            .previewDisplayName("Medium")
        }
    }
}
