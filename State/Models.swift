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
    let phone: String
    let balance: String
    let minutes: Limit
    let data: Limit
    let sms: Limit
}
struct WidgetSettings {
    let smallType: String
    let mediumLeftType: String
    let mediumRightType: String
}

struct ModelEntry {
    public let limits: Limits
    public let settings: WidgetSettings
}

struct LastLimitsEntry: TimelineEntry {
    public let date: Date
    public let entry: ModelEntry

}

let exampleLastLimitsEntry = LastLimitsEntry (date: Date(),
                                              entry: ModelEntry(
                                              limits: Limits(
                                                phone: "+7 (800) 555-35-35",
                                                balance: "345.54",
                                                minutes: Limit(total: 100, left: 20),
                                                data: Limit(total: 328, left: 123) ,
                                                sms:Limit(total: 200, left: 60)),
                                               settings: WidgetSettings(smallType: "ad", mediumLeftType: "ad", mediumRightType: "quick")))
