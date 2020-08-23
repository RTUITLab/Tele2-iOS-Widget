//
//  ContentView.swift
//  Tele2 Widget
//
//  Created by Ivanov on 21.08.2020.
//

import SwiftUI
import Foundation
import Combine
import WidgetKit

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
        ScrollView(content: {
            
            Text("Размер виджета")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
            
            HStack(content: {
            Button(action: {
                self.viewRouter.currentPage = "Small"
            }) {
                VStack(alignment: .center){
                    Text("Маленький")
                        .font(Font.custom("SF Ui Display", size: 15))
                        .bold()
                        .font(.footnote)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                }
                .frame(width: 100,height:20)
                .padding()
                .foregroundColor(.white)
                .background(Color.white)
                
                
                .cornerRadius(25)
            }
                Button(action: {
                    self.viewRouter.currentPage = "Medium"
                }) {
                    VStack(alignment: .center){
                        Text("Средний")
                            .font(Font.custom("SF Ui Display", size: 15))
                            .bold()
                            .font(.footnote)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                    }
                    .frame(width: 100,height:20)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.white)
                    
                    
                    .cornerRadius(25)
                }
                Button(action: {
                    self.viewRouter.currentPage = "Large"
                }) {
                    VStack(alignment: .center){
                        Text("Большой")
                            .font(Font.custom("SF Ui Display", size: 15))
                            .bold()
                            .font(.footnote)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                    }
                    .frame(width: 100,height:20)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.white)
                    
                    
                    .cornerRadius(25)
                }
            })
            .padding(.top)
            .padding(.bottom, 30.0)
            
            VStack(content: {
            if (viewRouter.currentPage == "Small"){
                VStack(content: {
                    
                    
                
                    WraperSmall(limits: exampleLastLimitsEntry.entry.limits, widgetSettings: exampleLastLimitsEntry.entry.settings, family: .systemSmall)
                        
                        .frame(width: 155, height: 155, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
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
                    WraperSmall(limits: exampleLastLimitsEntry.entry.limits, widgetSettings: exampleLastLimitsEntry.entry.settings, family: .systemSmall)
                    ShopAd()
                        .layoutPriority(1)
                })
                .frame(width: 360, height: 169, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(6.0)
                .overlay(RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.white, lineWidth: 5.0))
            }
            
            })
//            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: 360, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: 379, alignment: .top)
            .padding(.bottom)
            
            Text("Выберите").foregroundColor(Color.white) + Text(viewRouter.currentPage == "Small" ? " 1 " : " 2 ").foregroundColor(Color(red: 1.0, green: 0.26666666666666666, blue: 0.6470588235294118)) + Text((viewRouter.currentPage == "Small" ? "опцию" : "опции") + " (сейчас выбрана по умолчанию):").foregroundColor(Color.white)
           
            Spacer()
            
            CheckboxField(id: "Test",
                          label: "kek",
                          size: 14,
                          color: Color.white,
                          textSize: 14,
                          callback: test)
            
            Button(action: {
                WidgetCenter.shared.reloadAllTimelines()
            }) {
                VStack(alignment: .center){
                    Text("Обновить")
                        .font(Font.custom("SF Ui Display", size: 15))
                        .bold()
                        .font(.footnote)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                }
                .frame(width: 100,height:20)
                .padding()
                .foregroundColor(.white)
                .background(Color.white)
                
                
                .cornerRadius(25)
            }
            
        })
        .padding(.bottom, 20.0)
    }
    
    
    func test (id: String, isMarked: Bool)
    {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11 Pro Max")
    }
}
