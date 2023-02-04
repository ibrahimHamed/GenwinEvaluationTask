//
//  Alamofire.swift
//  Genwin
//
//  Created by Ibrahim Hamed on 03/02/2023.
//

import Foundation

public extension Collection {

    /// Convert JSON String and returns the pretty printed JSON string or an empty string if any error occur.
    func json() -> String {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: [.prettyPrinted])
            return String(data: jsonData, encoding: .utf8) ?? "{}"
        } catch {
            print("json serialization error: \(error)")
            return "{}"
        }
    }
}
