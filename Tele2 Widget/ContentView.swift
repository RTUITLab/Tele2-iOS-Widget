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
    
    var currentPage: String = "Medium" {
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
    @State var settings: WidgetSettings = WidgetSettings(smallType: "ad", mediumLeftType: "ad", mediumRightType: "offer")
    
    
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
                            .foregroundColor(viewRouter.currentPage == "Small" ? .white : .black)
                            .multilineTextAlignment(.center)
                    }
                    .frame(width: 100,height:20)
                    .padding()
                    .foregroundColor(.white)
                    .background(viewRouter.currentPage == "Small" ? Color.pink : Color.white)
                    
                    
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
                            .foregroundColor(viewRouter.currentPage == "Medium" ? .white : .black)
                            .multilineTextAlignment(.center)
                    }
                    .frame(width: 100,height:20)
                    .padding()
                    .foregroundColor(.white)
                    .background(viewRouter.currentPage == "Medium" ? Color.pink : Color.white)
                    
                    
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
                            .foregroundColor(viewRouter.currentPage == "Large" ? .white : .black)
                            .multilineTextAlignment(.center)
                    }
                    .frame(width: 100,height:20)
                    .padding()
                    .foregroundColor(.white)
                    .background(viewRouter.currentPage == "Large" ? Color.pink : Color.white)
                    
                    
                    .cornerRadius(25)
                }
            })
            .padding(.top)
            .padding(.bottom, 30.0)
            
            VStack(content: {
                if (viewRouter.currentPage == "Small"){
                    VStack(content: {
                        WraperSmall(limits: exampleLastLimitsEntry.entry.limits, widgetSettings: settings, family: .systemSmall, giftIndicatorType: "offer")
                            
                            .frame(width: 155, height: 155, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        
                    })
                    
                    
                    .frame(width: 169, height: 169, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .overlay(RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white, lineWidth: 5.0))
                } else if (viewRouter.currentPage == "Large")
                {
                    VStack(content: {
                        
                        
                        LargeCombined(family: .systemLarge, entry: exampleLastLimitsEntry.entry.limits, giftIndicatorType: "offer")
                            .overlay(RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.white, lineWidth: 5.0))
                        
                        
                    })
                    .frame(width: 360, height: 379, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.black)
                    
                } else if (viewRouter.currentPage == "Medium")
                {
                    
                    HStack(content: {
                        WraperMedium(limits: exampleLastLimitsEntry.entry.limits, widgetSettings: settings, offer: "offer")
                        
                    })
                    .frame(width: 360, height: 169, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding(6.0)
                    .overlay(RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white, lineWidth: 5.0))
                }
                
            })
            .padding(.bottom)
            
            Text("Выберите").foregroundColor(Color.white) + Text(viewRouter.currentPage == "Small" ? " 1 " : " 2 ").foregroundColor(Color(red: 1.0, green: 0.26666666666666666, blue: 0.6470588235294118)) + Text((viewRouter.currentPage == "Small" ? "опцию" : "опции") + " (сейчас выбрана по умолчанию):").foregroundColor(Color.white)
            
            Spacer()
            
            if(viewRouter.currentPage == "Medium")
            {
                HStack(){
                    VStack()
                    {
                        CheckboxField(
                            id: "ad",
                            label: "",
                            size: 25,
                            textSize: 14,
                            callback: setSettingsLeft,
                            isMarked: isMarked(id: "ad")
                        )
                        CheckboxField(
                            id: Gender.male.rawValue,
                            label: "",
                            size: 25,
                            textSize: 14,
                            callback: setSettingsLeft
                        )
                        
                        CheckboxField(
                            id: "offer",
                            label: "",
                            size: 25,
                            textSize: 14,
                            callback: setSettingsLeft,
                            isMarked: isMarked(id: "offer")
                        )
                        
                        CheckboxField(
                            id: "quick",
                            label: "",
                            size: 25,
                            textSize: 14,
                            callback: setSettingsLeft,
                            isMarked: isMarked(id: "quick")
                        )
                    }
                    
                    VStack()
                    {
                        Text("Остаток по пакетам")
                            .foregroundColor(Color.white)
                            .font(Font.system(size: 25))
                        Text("Информация о подарках")
                            .foregroundColor(Color.white)
                            .font(Font.system(size: 25))
                        Text("Личные предложения")
                            .foregroundColor(Color.white)
                            .font(Font.system(size: 25))
                        Text("Быстрые действия")
                            .foregroundColor(Color.white)
                            .font(Font.system(size: 25))
                    }
                    
                    VStack()
                    {
                        CheckboxField(
                            id: "ad",
                            label: "",
                            size: 25,
                            textSize: 14,
                            callback: setSettingsRight,
                            isMarked: isMarked(id: "ad", side: "right")
                        )
                        CheckboxField(
                            id: Gender.male.rawValue,
                            label: "",
                            size: 25,
                            textSize: 14,
                            callback: setSettingsRight
                        )
                        
                        CheckboxField(
                            id: "offer",
                            label: "",
                            size: 25,
                            textSize: 14,
                            callback: setSettingsRight,
                            isMarked: isMarked(id: "offer", side: "right")
                        )
                        
                        CheckboxField(
                            id: "quick",
                            label: "",
                            size: 25,
                            textSize: 14,
                            callback: setSettingsRight,
                            isMarked: isMarked(id: "quick", side: "right")
                        )
                    }
                    
                    
                }
            }
            else {
                VStack(alignment: .leading){
                    CheckboxField(
                        id: "ad",
                        label: "Остаток по пакетам",
                        size: 20,
                        textSize: 14,
                        callback: small,
                        isMarked: isMarked(id: "ad")
                    )
                    CheckboxField(
                        id: Gender.male.rawValue,
                        label: "Информация о подарках",
                        size: 20,
                        textSize: 14,
                        callback: small
                    )
                    
                    CheckboxField(
                        id: "offer",
                        label: "Личные предложения",
                        size: 20,
                        textSize: 14,
                        callback: small,
                        isMarked: isMarked(id: "offer")
                    )
                    
                    CheckboxField(
                        id: "quick",
                        label: "Быстрые действия",
                        size: 20,
                        textSize: 14,
                        callback: small,
                        isMarked: isMarked(id: "quick")
                    )
                }
                .padding()
            }
            
            
            
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
    
    func small(id: String, isMarked: Bool)
    {
        self.settings = WidgetSettings(smallType: id, mediumLeftType: settings.mediumLeftType,mediumRightType: settings.mediumRightType)
        LimitsLoader.updateWidgetSettings(completion: { result in
            WidgetCenter.shared.reloadAllTimelines()
        }, settings: self.settings)
    }
    
    func setSettingsLeft(id: String, isMarked: Bool)
    {
        setSettings(id: id, isMarked: isMarked, side: "left")
    }
    func setSettingsRight(id: String, isMarked: Bool)
    {
        setSettings(id: id, isMarked: isMarked, side: "right")
    }
    
    func setSettings (id: String, isMarked: Bool, side: String)
    {
        if (side == "left")
        {
            self.settings = WidgetSettings(smallType: settings.smallType, mediumLeftType: id, mediumRightType: settings.mediumRightType)
        } else {
            self.settings = WidgetSettings(smallType: settings.smallType, mediumLeftType: settings.mediumLeftType, mediumRightType: id)
        }
        LimitsLoader.updateWidgetSettings(completion: { result in
            WidgetCenter.shared.reloadAllTimelines()
        }, settings: self.settings)
    }
    func isMarked(id: String, side: String = "left") -> Bool {
        if(viewRouter.currentPage == "Small")
        {
            return id == settings.smallType
        } else if(viewRouter.currentPage == "Medium") {
            if (side == "left") {
                return id == settings.mediumLeftType
            }
            
            return id == settings.mediumRightType
        }
        return false
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11 Pro Max")
    }
}
