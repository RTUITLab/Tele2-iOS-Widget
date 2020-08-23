//
//  DataReceiving.swift
//  Tele2 Widget
//
//  Created by Student on 22.08.2020.
//

enum LolError: Error {
    case LolErr
}

import Foundation

struct LimitsLoader {
    static func fetch(completion: @escaping(Result<ModelEntry, Error>) -> Void) {
        let branchContentsURL = URL(string: "https://35f5d8bc8dc9.ngrok.io/api/widgetapi/entry")!
        let task = URLSession.shared.dataTask(with: branchContentsURL) {
            (data, response, error) in
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            do {
                let model: ModelEntry
                try model = getCommitInfo(fromData: data!)
                completion(.success(model))
            } catch {
                completion(.failure(LolError.LolErr))
            }
        }
        task.resume()
    }
    
    static func getCommitInfo(fromData data: Foundation.Data) throws -> ModelEntry {
        let json = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
        
        let limitsObject = json["limits"] as! [String: Any]
        
        let minutesObject = limitsObject["minutes"] as! [String: Any]
        let dataObject = limitsObject["data"] as! [String: Any]
        let smsObject = limitsObject["sms"] as! [String: Any]
        
        let phone = limitsObject["phone"] as! String
        let balance = limitsObject["balance"] as! String
        
        let minTotal = minutesObject["total"] as! Int
        let minLeft = minutesObject["left"] as! Int
        
        let dataTotal = dataObject["total"] as! Int
        let dataLeft = dataObject["left"] as! Int
        
        let smsTotal = smsObject["total"] as! Int
        let smsLeft = smsObject["left"] as! Int

        let settingsObject = json["settings"] as! [String: Any]

        let smallType = settingsObject["smallType"] as! String

        let mediumLeftType = settingsObject["mediumLeftType"] as! String

        let mediumRightType = settingsObject["mediumRightType"] as! String


        return ModelEntry(limits: Limits(phone: phone, balance: balance, minutes: Limit(total: minTotal, left: minLeft), data: Limit(total: dataTotal, left: dataLeft), sms: Limit(total: smsTotal, left: smsLeft)), settings: WidgetSettings(smallType: smallType, mediumLeftType: mediumLeftType, mediumRightType: mediumRightType))
    }
}
