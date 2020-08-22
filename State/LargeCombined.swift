//
//  LargeCombined.swift
//  Tele2 Widget
//
//  Created by Anton Pushkin on 22.08.2020.
//

import WidgetKit
import SwiftUI

struct LargeCombined: View {
    let entry: LastCommitEntry
    var family : WidgetFamily
    var progressValue: Float = 0.9
    
    var body: some View {
        
        VStack(content: {
            Large(entry: entry, family: family)
                .padding(.top, 20)
                .padding(.horizontal, 20)
            Spacer()
            LargeBottom(entry: entry, family: family)
        })
        
    }
    func progressWidth() -> Float {
        switch family{
        case .systemSmall:
            return 3
        case .systemMedium:
            return 4
        default:
            return 12
        }
    }
    
    static func format(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy HH:mm"
        return formatter.string(from: date)
    }
}

struct LargeCombined_Previews: PreviewProvider {
    static var previews: some View {
        
        LargeCombined(entry: LastCommitEntry(date: Date(), commit: Commit(messager: "", author: "", date: "")), family: .systemLarge)
            .previewContext(WidgetPreviewContext(family: .systemLarge))
            .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .center)
//            .padding()
            .background(Color(red: 0.10980392156862745, green: 0.10980392156862745, blue: 0.11764705882352941))
    }
}


