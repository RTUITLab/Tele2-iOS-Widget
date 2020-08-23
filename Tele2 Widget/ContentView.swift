//
//  ContentView.swift
//  Tele2 Widget
//
//  Created by Ivanov on 21.08.2020.
//

import SwiftUI
import Foundation
import Combine

class ViewRouter: ObservableObject {
    let objectWillChange = PassthroughSubject<ViewRouter,Never>()
    
    var currentPage: String = "Small" {
        didSet {
            objectWillChange.send(self)
        }
}
}

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
                        
                        
                        WidgetSetting(viewRouter: ViewRouter())
                            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .top)
                            .edgesIgnoringSafeArea(.bottom)
//                            .background(Color.white)
                        
                        
                    })
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
                    .edgesIgnoringSafeArea(.bottom)
                    
                    
                    
                    
                })
    }
}

struct WidgetSetting: View {
    
    @ObservedObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack(content: {
            
            HStack(content: {
            Button(action: {
                self.viewRouter.currentPage = "Small"
            }) {
                VStack(alignment: .center){
                    Text("Small")
                        .font(Font.custom("SF Ui Display", size: 20))
                        .bold()
                        .font(.footnote)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                }
                .frame(width: 100,height:20)
                .padding()
                .foregroundColor(.white)
                .background(Color.yellow)
                
                
                .cornerRadius(25)
            }
                Button(action: {
                    self.viewRouter.currentPage = "Medium"
                }) {
                    VStack(alignment: .center){
                        Text("Medium")
                            .font(Font.custom("SF Ui Display", size: 20))
                            .bold()
                            .font(.footnote)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                    }
                    .frame(width: 100,height:20)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.yellow)
                    
                    
                    .cornerRadius(25)
                }
                Button(action: {
                    self.viewRouter.currentPage = "Large"
                }) {
                    VStack(alignment: .center){
                        Text("Large")
                            .font(Font.custom("SF Ui Display", size: 20))
                            .bold()
                            .font(.footnote)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                    }
                    .frame(width: 100,height:20)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.yellow)
                    
                    
                    .cornerRadius(25)
                }
            })
            .padding()
            
            if (viewRouter.currentPage == "Small"){
                VStack(content: {
                    
                    
                
                    MobileState(family: .systemSmall, entry: exampleLastLimitsEntry.entry.limits)
                        
                        .frame(width: 169, height: 169, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                })
                
                
                .frame(width: 169, height: 169, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .overlay(RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.white, lineWidth: 5.0))
            } else if (viewRouter.currentPage == "Large")
            {
                VStack(content: {
                    
                    
                    LargeCombined(family: .systemLarge, entry: exampleLastLimitsEntry.entry.limits)
                        .overlay(RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.white, lineWidth: 5.0))
                    
                    
                    
                })
                .frame(width: 360, height: 379, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(.black)
                
            } else if (viewRouter.currentPage == "Medium")
            {
                
                HStack(content: {
                    MobileState(family: .systemSmall, entry: exampleLastLimitsEntry.entry.limits)
                        .scaledToFit()
                    ShopAd()
                        .layoutPriority(1)
                })
                .frame(width: 360, height: 169, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(6.0)
                .overlay(RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.white, lineWidth: 5.0))
            }
            
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11 Pro Max")
    }
}
