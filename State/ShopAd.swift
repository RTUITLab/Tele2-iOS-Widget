//
//  ShopAd.swift
//  Tele2 Widget
//
//  Created by Ivanov on 22.08.2020.
//

import WidgetKit
import SwiftUI

struct ShopAd: View {
    var body: some View {
        HStack {
            VStack(alignment: .center){
                VStack(alignment: .center){
                    
                HStack(alignment: .center){
                    Text ("Недалеко от Вас")
                        .font(Font.custom("SF Ui Display", size: 11))
                        .foregroundColor(Color(red: 1.0, green: 0.34901960784313724, blue: 0.6392156862745098))
                        .multilineTextAlignment(.center)
                        .padding([.top, .leading])
                    Circle()
                        
                    .fill(Color(red: 1.0, green: 0.34901960784313724, blue: 0.6392156862745098))
                    .frame(width:9, height:9)
                        .padding([.top, .leading])
                                           
                    
                }
                    Image("adamas")
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(width:45, height:45)
                        .padding(.top, 1.0)
                            
                    
                }
                
                VStack(alignment: .center) {
                    Text("Бесплатная подвеска и")
                        .font(Font.custom("SF Ui Display", size: 11))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.top, 1.0)
                    
                    Text ("скидка 15% в")                       .font(Font.custom("SF Ui Display", size: 11))
                        .foregroundColor(.white)
                        +
                        Text(" АДАМАС")
                        .font(Font.custom("SF Ui Display", size: 11))                     .foregroundColor(.white)
                    
                }
                .padding(.bottom)
                
                Button(action: {
                    print("Delete tapped!")
                }) {
                    VStack(alignment: .center){
                        Text("Активировать")
                            .font(Font.custom("SF Ui Display", size: 12))
                            .bold()
                            .font(.footnote)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.yellow)
                    .frame(height:25)
                    
                    .cornerRadius(12)
                }
                .padding(.bottom, -7.0)
                .padding(.bottom)
                .padding((.all), 7.0)
                .frame(height: 0.0)
                .foregroundColor(.gray)
            }
            .padding(.bottom)
            
            
            
        }
        
    }
}


struct ShopAd_Previews: PreviewProvider {
    static var previews: some View {
        ShopAd()
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .center)
            .padding()
            .background(Color(red: 0.10980392156862745, green: 0.10980392156862745, blue: 0.11764705882352941))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
            .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
        
    }
}
