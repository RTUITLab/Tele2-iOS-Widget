//
//  LargeBottom.swift
//  Tele2 Widget
//
//  Created by Anton Pushkin on 22.08.2020.
//

import WidgetKit
import SwiftUI

struct LargeBottom: View {
    let entry: LastCommitEntry
    var family : WidgetFamily
    var progressValue: Float = 0.9
    
    var body: some View {
        
        HStack( content: {
            Image("Cross")
                .resizable()
                .frame(width: 150.0, height: 150.0)
            VStack( alignment: .center, content: {
                Text("Подвеска в подарок")
                    .padding(5)
                Text("Получите серебряную подвеску в подарок и скидку 15% в АДАМАС в ТЦ «Авеню» прямо сейчас")
                    .font(.system(size: 10))
                    .multilineTextAlignment(.center)
                    .padding(5)
                ZStack(content: {
                
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: 110, height: 25)
                        .cornerRadius(12)
                    Text("Активировать")
                        .foregroundColor(Color.white)
                        .font(.system(size: 14))
                        .padding(5)
                })
                
                
            })
            
        })
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .background(Color.white)
        
    
        
        
        
        
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

struct LargeBottom_Previews: PreviewProvider {
    static var previews: some View {
        
        LargeBottom(entry: LastCommitEntry(date: Date(), commit: Commit(messager: "", author: "", date: "")), family: .systemLarge)
            .previewContext(WidgetPreviewContext(family: .systemLarge))
            .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .center)
//            .padding()
            .background(Color(red: 0.10980392156862745, green: 0.10980392156862745, blue: 0.11764705882352941))
    }
}

