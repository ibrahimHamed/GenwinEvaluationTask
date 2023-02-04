//
//  GlobalResponseModel.swift
//  Genwin
//
//  Created by Ibrahim Hamed on 04/02/2023.
//

import Foundation

class GlobalResponseModel: Codable {
    var status: String
    var statusMessage: String
    
    enum CodingKeys: String, CodingKey {
        case status
        case statusMessage = "status_message"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decode(String.self, forKey: .status)
        statusMessage = try values.decode(String.self, forKey: .statusMessage)
    }
    
}
