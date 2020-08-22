//
//  Models.swift
//  Tele2 Widget
//
//  Created by Ivanov on 22.08.2020.
//

import WidgetKit

struct LastCommitEntry: TimelineEntry {
    public let date: Date
    public let commit: Commit
}

struct Commit {
    let messager: String
    let author: String
    let date: String
}
