//
//  State.swift
//  State
//
//  Created by Ivanov on 21.08.2020.
//

import WidgetKit
import SwiftUI


struct LimitsTimeLine: TimelineProvider {
    typealias Entry = LastLimitsEntry
    
    public func getSnapshot(in context: Context, completion: @escaping (Entry) -> ()) {
        let entryData = exampleLastLimitsEntry.entry

        completion(LastLimitsEntry(date: Date(), entry: entryData))
    }
    
    public func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        let currentDate = Date()
        let refreshDate = Calendar.current.date(byAdding: .minute, value: 5, to: currentDate)!
//        let timeline = Timeline(entries: [exampleLastLimitsEntry], policy: .after(refreshDate))
//        completion(timeline)
        LimitsLoader.fetch { result in
            let entryData: ModelEntry


            if case .success(let fetchedLimits) = result {
                entryData = fetchedLimits
            } else {
                entryData = exampleLastLimitsEntry.entry
            }
            let entry = LastLimitsEntry(date: currentDate, entry: entryData)
            let timeline = Timeline(entries: [entry], policy: .after(refreshDate))
            completion(timeline)
        }
    }
}

struct CommitCheckerWidgetView: View {
    let entry: LastLimitsEntry
    @Environment(\.widgetFamily) var family
    
    var body: some View {
        
        VStack() {
            switch family{
            case .systemSmall:
                MobileState(family: family, entry: self.entry.entry.limits)
                
            case .systemMedium:
                HStack(content: {
                    MobileState(family: family, entry: self.entry.entry.limits)
                        .scaledToFit()
                    ShopAd()
                        .layoutPriority(1)
                })
                .padding(6.0)
                
            default:
                LargeCombined(family: family, entry: self.entry.entry.limits)
            }
        }
        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .center)
        .background(Color(red: 0.10980392156862745, green: 0.10980392156862745, blue: 0.11764705882352941))
    }
    
    
}

@main
struct CommitCheckerWidgetWidget: Widget {
    
    private let kind: String = "CommitCheckerWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: LimitsTimeLine()) { entry in
            CommitCheckerWidgetView(entry: entry)
        }
        .configurationDisplayName("Lasted Commit")
        .description("Widget test")
        
    }
}

struct State_PreviewsLarge: PreviewProvider {
    static var previews: some View {
        Group {
            CommitCheckerWidgetView(entry: exampleLastLimitsEntry)
                .environment(\.sizeCategory, .extraLarge)
                .previewContext(WidgetPreviewContext(family: .systemLarge))
                .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
                .previewDisplayName("Large")
            
            
            CommitCheckerWidgetView(entry: exampleLastLimitsEntry)
                .environment(\.sizeCategory, .extraLarge)
                .previewContext(WidgetPreviewContext(family: .systemMedium))
                .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
                .previewDisplayName("Medium and adamas")
            
            CommitCheckerWidgetView(entry: exampleLastLimitsEntry)
                .previewContext(WidgetPreviewContext(family: .systemSmall))
                .environment(\.sizeCategory, .extraLarge)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
                .previewDisplayName("Small")
            
            
        }
    }
}
