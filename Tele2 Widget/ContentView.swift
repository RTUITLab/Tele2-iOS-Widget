//
//  ContentView.swift
//  Tele2 Widget
//
//  Created by Ivanov on 21.08.2020.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        
        ZStack(content:
                {
                    Color(red: 0.10980392156862745, green: 0.10980392156862745, blue: 0.11764705882352941).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    
                    VStack(spacing: 5,content: {
                        Image("logoT2")
                            .resizable()
                            .frame(width: 120, height: 45, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding()
                        
                        Text("Приложение + Widget")
                            .foregroundColor(.white)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 40.0)
                        
                        
                        WidgetSetting()
                            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .edgesIgnoringSafeArea(.bottom)
//                            .background(Color.white)
                        
                        
                    })
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .edgesIgnoringSafeArea(.bottom)
                    
                    
                    
                    
                })
    }
}

struct WidgetSetting: View {
    var body: some View {
        VStack(content: {
            VStack(content: {
                
                
                MobileState(family: .systemSmall, entry: exampleLastLimitsEntry.entry.limits, giftIndicatorType: "none")
                    
                    .frame(width: 149, height: 149, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
            })
            
            
            .frame(width: 169, height: 169, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .overlay(RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.white, lineWidth: 5.0))
            
            VStack(content: {
                
                
                LargeCombined(family: .systemLarge, entry: exampleLastLimitsEntry.entry.limits)
                    .overlay(RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white, lineWidth: 5.0))
                
                
                
            })
            .frame(width: 360, height: 379, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .foregroundColor(.black)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
