//
//  State.swift
//  State
//
//  Created by Ivanov on 21.08.2020.
//

import WidgetKit
import SwiftUI

struct Commit {
    let messager: String
    let author: String
    let date: String
}

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

struct LastCommitEntry: TimelineEntry {
    public let date: Date
    public let commit: Commit
}

struct PlaceholderView: View {
    var body: some View {
        Text("Loading...")
    }
}

struct SmallRectStatus: View {
    let entry: LastCommitEntry
    
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
    
    static func format(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy HH:mm"
        return formatter.string(from: date)
    }
}

struct CommitCheckerWidgetView: View {
    let entry: LastCommitEntry
    
    var body: some View {
        VStack(alignment: .leading) {
            SmallRectStatus(entry: entry)
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
