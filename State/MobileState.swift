//
//  MobileState.swift
//  Tele2 Widget
//
//  Created by Ivanov on 22.08.2020.
//

import WidgetKit
import SwiftUI

struct MobileState: View {
    let entry: LastCommitEntry
    var family : WidgetFamily
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            
            VStack(content: {
                Image("logoT2")
                    .resizable()
                    .frame(width: 53, height: 20)
            })
            .frame(width: 70, height: 20, alignment: .bottom)
            
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                Text("Placeholder")
            })
            Text("Lastest Commit")
                .font(.system(.title3))
                .foregroundColor(.black)
            Text(entry.commit.messager)
                .font(.system(.callout))
                .foregroundColor(.black)
                .bold()
            Text("by \(entry.commit.author) at \(entry.commit.date)")
                .font(.system(.caption))
                .foregroundColor(.black)
            Text("Updated at \(Self.format(date:entry.date))")
                .font(.system(.caption2))
                .foregroundColor(.black)
        }
    }
    func progressWidth() -> Float {
        switch family{
        case .systemSmall:
            return 4
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

struct MobileState_Previews: PreviewProvider {
    static var previews: some View {
        
        MobileState(entry: LastCommitEntry(date: Date(), commit: Commit(messager: "", author: "", date: "")), family: .systemSmall)
            .previewContext(WidgetPreviewContext(family: .systemSmall))
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .center)
            .padding()
            .background(Color(red: 0.10980392156862745, green: 0.10980392156862745, blue: 0.11764705882352941))
    }
}
