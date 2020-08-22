//
//  OffersPage.swift
//  Tele2 Widget
//
//  Created by Ivanov on 22.08.2020.
//

import SwiftUI

struct OffersPage: View {
    var body: some View {
        ScrollView(content: {
            GeometryReader { reader in
                
                Image("Podveska")
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .offset(y: -reader.frame(in: .global).minY)
                    .frame(width: UIScreen.main.bounds.width, height: reader.frame(in: .global).minY + 300)
            }
            .frame(height: 300)
            
            VStack(content: {
                
                HStack(content: {
                    
                    VStack(alignment: .leading, content: {
                        
                        Text("Подвестка в подарок")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, 2.0)
                        
                        Text("Адамас")
                            .font(.title3)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.leading)
                        
                    })
                    .padding(.leading)
                    Spacer()
                    Image("adamasLogo")
                        .resizable()
                        .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .cornerRadius(10)
                        .padding(.horizontal)
                })
                .padding(.leading)
                
                Spacer()
                
                VStack(content: {
                    Image("qr_code")
                        .resizable()
                })
                .frame(width: 220, height: 220, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(.vertical, 5.0)
                
                Text("Предложение активировано. Покажите QR-код на кассе, чтобы воспользоваться предложением. ")
                    .font(.body)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.horizontal)
                
                
                HStack(content: {
                    
                    Image("clock")
                        .resizable()
                        .frame(width: 25, height: 25)
                    
                    Text("QR-код действует до 10.10.2020")
                        .foregroundColor(Color.white)
                    Spacer()
                })
                .frame(alignment: .leading)
                .padding([.leading, .bottom])
                
                Text("Получи серебрянную подвестку в подарок и скидку 15% в АДАМАС")
                    .font(.body)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.horizontal)
                
                
                HStack(content: {
                    Text("Оцените предложение")
                        .font(.body)
                        .foregroundColor(Color.white)
                        .padding(.leading, 25)
                    
                    Image("like")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .padding(.horizontal, 10.0)
                    
                    Image("noLike")
                        .resizable()
                        
                        .frame(width: 26, height: 26)
                        .padding(.horizontal, 10.0)
                    Spacer()
                })
                .frame(alignment: .leading)
                .padding(.top, 40.0)
                
                
            })
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
            .padding(.top, 15.0)
            .background(Color(red: 0.10980392156862745, green: 0.10980392156862745, blue: 0.11764705882352941))
            .cornerRadius(25)
            
        })
        //        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .background(Color(red: 0.10980392156862745, green: 0.10980392156862745, blue: 0.11764705882352941).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/))
    }
}

struct OffersPage_Previews: PreviewProvider {
    static var previews: some View {
        OffersPage()
            .previewDevice("iPhone 11 Pro Max")
    }
}
