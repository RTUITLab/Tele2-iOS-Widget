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
                    Text ("Может быть")
                        .font(.caption2)
                        .foregroundColor(.white)
                        .bold()
                        +
                        Text(" интересно")
                        .font(.caption2)
                        .foregroundColor(Color(red: 1.0, green: 0.34901960784313724, blue: 0.6392156862745098))
                        .bold()
                    
                    Image("adamas")
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(width:45, height:45)
                }
                .padding(.top)
                
                VStack(alignment: .center) {
                    Text("Бесплатная подвеска и")
                        .font(.caption2)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.top, 1.0)
                    
                    Text ("скидка 15%")
                        .font(.caption2)
                        .foregroundColor(.white)
                        .bold()
                        +
                        Text(" недалко от вас")
                        .font(.caption2)
                        .foregroundColor(Color(red: 1.0, green: 0.34901960784313724, blue: 0.6392156862745098))
                        .bold()
                    
                }
                .padding(.bottom)
                
                Button(action: {
                    print("Delete tapped!")
                }) {
                    VStack(alignment: .center){
                        Text("Активировать")
                            .padding(.vertical)
                            .font(.footnote)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.yellow)
                    .frame(height:25)
                    
                    .cornerRadius(15)
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
