//
//  DataReceiving.swift
//  Tele2 Widget
//
//  Created by Student on 22.08.2020.
//

import Foundation

struct LimitsLoader {
    static func fetch(completion: @escaping(Result<Limits, Error>) -> Void) {
        let branchContentsURL = URL(string: "https://my-json-server.typicode.com/rtuitlab/Tele2-iOS-Widget/limits")!
        let task = URLSession.shared.dataTask(with: branchContentsURL) {
            (data, response, error) in
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            let limits = getCommitInfo(fromData: data!)
            completion(.success(limits))
        }
        task.resume()
    }
    
    static func getCommitInfo(fromData data: Foundation.Data) -> Limits {
        let json = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
        let minutesObject = json["minutes"] as! [String: Any]
        let dataObject = json["data"] as! [String: Any]
        let smsObject = json["sms"] as! [String: Any]
        
        let minTotal = minutesObject["total"] as! Int
        let minLeft = minutesObject["left"] as! Int
        
        let dataTotal = dataObject["total"] as! Int
        let dataLeft = dataObject["left"] as! Int
        
        let smsTotal = smsObject["total"] as! Int
        let smsLeft = smsObject["left"] as! Int

        
        return Limits(minutes: Limit(total: minTotal, left: minLeft), data: Limit(total: dataTotal, left: dataLeft), sms: Limit(total: smsTotal, left: smsLeft))
    }
}
