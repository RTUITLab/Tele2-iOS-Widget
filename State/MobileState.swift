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
    
    var body: some View {
        VStack(alignment: .center, spacing: 4) {
            
            HStack(content: {
                VStack(content: {
                    Image("logoT2")
                    //                        .resizable()
                    //                        .frame(width: 53, height: 20)
                })
                //                .frame(width: 50, height: 20, alignment: .bottom)
                Spacer()
                VStack(content: {
                    Image("gift")
                    //                        .resizable()
                    //                        .frame(width: 21.0, height: 20.0)
                })
            })
            .padding(.bottom, 10.0)
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content: {
                Text("+7 (900) 987-00-00")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .allowsTightening(true)
            })
            .aspectRatio(contentMode: .fill)
            
            
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content: {
                Text("750,09 ₽")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            })
            .padding(.bottom, 2.0)
            
            HStack(content: {
                VStack(content: {
                    Text("Мин")
                        .font(.footnote)
                        .foregroundColor(Color.white)
                    ProgressBar(counter: 30, countTo: 100, width: progressWidth())
                })
                
                VStack(content: {
                    Text("Гб")
                        .font(.footnote)
                        .foregroundColor(Color.white)
                    ProgressBar(counter: 70, countTo: 100, width: progressWidth())
                })
                
                VStack(content: {
                    Text("SMS")
                        .font(.footnote)
                        .foregroundColor(Color.white)
                        .allowsTightening(true)
                    
                    
                    ProgressBar(counter: 100, countTo: 100, width: progressWidth())
                    
                })
                
                
            })
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

struct MobileState_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MobileState(family: .systemSmall)
                .previewContext(WidgetPreviewContext(family: .systemSmall))
                .environment(\.sizeCategory, .extraLarge)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
                
                .background(Color(red: 0.10980392156862745, green: 0.10980392156862745, blue: 0.11764705882352941))
            
            HStack(alignment: .center){
                MobileState(family: .systemMedium)
                    
                    
                    
                
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
