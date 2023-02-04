//
//  GenericResponseModel.swift
//  Genwin
//
//  Created by Ibrahim Hamed on 04/02/2023.
//

import Foundation

class GenericResponseModel<T: Codable>: GlobalResponseModel {
    
    var data: T?
    
    enum CodingKeys: String, CodingKey {
        case data
        case status
        case statusMessage = "status_message"
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decode(String.self, forKey: .status)
        statusMessage = try values.decode(String.self, forKey: .statusMessage)
        data = try values.decodeIfPresent(T.self, forKey: .data)
    }
    
}
