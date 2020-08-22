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

struct Limit {
    let total: Int
    let left: Int
}

struct Limits {
    let minutes: Limit
    let data: Limit
    let sms: Limit
}

struct LastLimitsEntry: TimelineEntry {
    public let date: Date
    public let limits: Limits
}

let exampleLastLimitsEntry = LastLimitsEntry (date: Date(),
                                              limits: Limits(
                                                minutes: Limit(total: 100, left: 20),
                                                data: Limit(total: 328, left: 123) ,
                                                sms:Limit(total: 200, left: 60)))
