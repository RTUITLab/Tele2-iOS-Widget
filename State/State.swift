//
//  State.swift
//  State
//
//  Created by Ivanov on 21.08.2020.
//

import WidgetKit
import SwiftUI

struct CommitLoader {
    static func fetch(completion: @escaping(Result<Commit, Error>) -> Void) {
        let branchContentsURL = URL(string: "https://api.github.com/repos/RTUITLab/ITLab/branches/master")!
        let task = URLSession.shared.dataTask(with: branchContentsURL) {
            (data, response, error) in
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            let commit = getCommitInfo(fromData: data!)
            completion(.success(commit))
        }
        task.resume()
    }
    
    static func getCommitInfo(fromData data: Foundation.Data) -> Commit {
        let json = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
        let commitParentJson = json["commit"] as! [String: Any]
        let commitJson = commitParentJson["commit"] as! [String: Any]
        let authorJson = commitJson["author"] as! [String: Any]
        let message = commitJson["message"] as! String
        let author = authorJson["name"] as! String
        let date = authorJson["date"] as! String
        
        return Commit(messager: message, author: author, date: date)
    }
}

struct CommitTimeline: TimelineProvider {
    typealias Entry = LastCommitEntry
    
    public func getSnapshot(in context: Context, completion: @escaping (LastCommitEntry) -> ()) {
        let fakeCommit = Commit(messager: "Test", author: "Noname", date: "2020")
        let entry = LastCommitEntry(date: Date(), commit: fakeCommit)
        
        completion(entry)
    }
    
    public func getTimeline(in context: Context, completion: @escaping (Timeline<LastCommitEntry>) -> Void) {
        let currentDate = Date()
        let refreshDate = Calendar.current.date(byAdding: .minute, value: 5, to: currentDate)!
        
        CommitLoader.fetch { result in
            let commit: Commit
            if case .success(let fetchedCommit) = result {
                commit = fetchedCommit
            } else {
                commit = Commit(messager: "Failed", author: "", date: "")
            }
            let entry = LastCommitEntry(date: currentDate, commit: commit)
            let timeline = Timeline(entries: [entry], policy: .after(refreshDate))
            completion(timeline)
        }
    }
}



struct ProgressBar: View {
    var counter: Int
    var countTo: Int
    
    var width: Float = 15
    
    var body: some View {
        Circle()
            .stroke(style: StrokeStyle(
                lineWidth: CGFloat(self.width),
                lineCap: .round,
                lineJoin: .round
            ))
            .foregroundColor(Color.gray)
            
//            .frame(width: 250, height: 250)
            .overlay(
                Circle().trim(from:0, to: progress())
                    .stroke(style: StrokeStyle(
                        lineWidth: CGFloat(self.width),
                        lineCap: .round,
                        lineJoin: .round
                    ))
                    .foregroundColor(Color(red: 1.0, green: 0.34901960784313724, blue: 0.6392156862745098))
                    .animation(.easeInOut(duration: 0.2))
                    .rotationEffect(Angle(degrees: -90))
            )
    }
    
    func progress() -> CGFloat {
        return (CGFloat(counter) / CGFloat(countTo))
    }
}

struct CommitCheckerWidgetView: View {
    let entry: LastCommitEntry
    
    @Environment(\.widgetFamily) var family
    
    var body: some View {
        
        VStack(alignment: .leading) {
            switch family{
            case .systemSmall:
                MobileState(entry: entry, family: family)
            case .systemMedium:
                HStack(content: {
                    MobileState(entry: entry, family: family)
                    Spacer()
                    ShopAd()
                })
                
            default:
                Text("Large")
            }
        }
        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .leading)
        .padding()
        .background(Color(red: 0.10980392156862745, green: 0.10980392156862745, blue: 0.11764705882352941))
    }
    
    
}

@main
struct CommitCheckerWidgetWidget: Widget {
    
    private let kind: String = "CommitCheckerWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: CommitTimeline()) { entry in
            CommitCheckerWidgetView(entry: entry)
        }
        .configurationDisplayName("Lasted Commit")
        .description("Widget test")
        
    }
}

struct State_PreviewsLarge: PreviewProvider {
    static var previews: some View {
        CommitCheckerWidgetView(entry: LastCommitEntry(date: Date(), commit: Commit(messager: "Test", author: "", date: "")))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
struct State_PreviewsMedium: PreviewProvider {
    static var previews: some View {
        CommitCheckerWidgetView(entry: LastCommitEntry(date: Date(), commit: Commit(messager: "Test", author: "", date: "")))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}

struct State_PreviewsSmall: PreviewProvider {
    static var previews: some View {
        CommitCheckerWidgetView(entry: LastCommitEntry(date: Date(), commit: Commit(messager: "Test", author: "", date: "")))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
