//
//  Tele2_WidgetApp.swift
//  Tele2 Widget
//
//  Created by Ivanov on 21.08.2020.
//

import SwiftUI


extension View {
    
    
}

@main
struct Tele2_WidgetApp: App {
    @State var url: URL?;
    var body: some Scene {
        WindowGroup {
            VStack {
                switch url {
                case adamasURL:
                    OffersPage()
                case tarifURL:
                    Image("tarifBack")
                        .resizable()
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        .statusBar(hidden: true)
                case balanceURL:
                    Image("payT2Back")
                        .resizable()
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        .statusBar(hidden: true)
                default:
                    ContentView()
                        .statusBar(hidden: /*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
                        .preferredColorScheme(.dark)
                }
                
            }
            .onOpenURL(perform: { url in
                self.url = url
            })
            
            
        }
        
    }
}

struct Tele2_WidgetApp_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
            .previewDevice("iPhone 11 Pro Max")
    }
}
