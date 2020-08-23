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
    var body: some Scene {
        WindowGroup {
            ContentView()
                .statusBar(hidden: /*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
                .preferredColorScheme(.dark)
                .onOpenURL(perform: { url in
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Code@*/ /*@END_MENU_TOKEN@*/
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
