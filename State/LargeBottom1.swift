//
//  LargeBottom1.swift
//  Tele2 Widget
//
//  Created by Anton Pushkin on 22.08.2020.
//
import WidgetKit
import SwiftUI

struct LargeBottom1: View {
    var family : WidgetFamily
    
    var body: some View {
        
        VStack( content: {
            
            Text ("Мы подобрали")
                .font(.caption2)
                .foregroundColor(.white)
                .bold()
                +
            Text(" больше")
                .font(.caption2)
                .foregroundColor(Color(red: 1.0, green: 0.34901960784313724, blue: 0.6392156862745098))
                .bold()
                +
            Text (" предложения для Вас")
                .font(.caption2)
                .foregroundColor(.white)
                .bold()
            HStack(alignment: .center, content: {
                VStack(content: {
                    Image("adamas")
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(width:45, height:45)
                    Text("Подарок")
                        .font(.caption2)
                        .foregroundColor(.white)
                        .bold()
                })
                .padding(.leading, 50.0)
                .padding(.trailing, 10)
                Spacer()
                VStack(content: {
                    Image("Komus")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width:45, height:45)
                    Text("Кэшбек 5%")
                        .font(.caption2)
                        .foregroundColor(.white)
                        .bold()
                })
                Spacer()
                VStack(content: {
                    Image("NewBalance_logo")
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(width:45, height:45)
                    Text("Скидка 7,5%")
                        .font(.caption2)
                        .foregroundColor(.white)
                        .bold()
                })
                .padding(.trailing, 40)
                .padding(.top, 5)
            })
            Text ("Выберите предложение, чтобы посмотреть детали и активировать предложение.")
                .font(.caption2)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(3)
        })
        
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 150, alignment: .leading)
        .background(Color(red: 0.17254901960784313, green: 0.17254901960784313, blue: 0.1803921568627451))
        
    
        
        
        
        
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

struct LargeBottom1_Previews: PreviewProvider {
    static var previews: some View {
        
        LargeBottom1(family: .systemLarge)
            .previewContext(WidgetPreviewContext(family: .systemLarge))
            .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .center)
//            .padding()
            .background(Color(red: 0.10980392156862745, green: 0.10980392156862745, blue: 0.11764705882352941))
    }
}


