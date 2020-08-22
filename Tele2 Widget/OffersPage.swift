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
                        .padding(.bottom)
                        
                        Text("Адамас")
                            .font(.title3)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.leading)
                        
                    })
                    
                    Image("adamasLogo")
                        .resizable()
                        .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding(.leading, 50.0)
                })
                .padding(.leading)
                
                Spacer()
                
                Button(action: {
                    print("Delete tapped!")
                }) {
                    VStack(alignment: .center){
                        Text("Активировать")
                            .fontWeight(.bold)
                            .padding(.vertical)
                            .font(.title2)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                    }
                    .frame(width: 230,height:40)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.white)
                    
                    
                    .cornerRadius(40)
                }
                .padding(.vertical)
                
                Text("Получи серебрянную подвестку в подарок и скидку 15% в АДАМАС")
                    .font(.body)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal)
                
                
                HStack(content: {
                    Text("Оцените предложение")
                        .font(.body)
                        .foregroundColor(Color.white)
                        .padding(.leading, 25)
                        
                    Image("")
                    Spacer()
                    Image("")
                })
                .frame(alignment: .leading)
                .padding(.top, 40.0)
                
                
            })
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
            .padding(.top, 15.0)
            .background(Color.black)
            .cornerRadius(25)
            
        })
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .background(Color.black.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/))
    }
}

struct OffersPage_Previews: PreviewProvider {
    static var previews: some View {
        OffersPage()
            .previewDevice("iPhone 11 Pro Max")
    }
}
