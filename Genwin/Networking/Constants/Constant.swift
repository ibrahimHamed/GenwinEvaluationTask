//
//  Constant.swift
//  Genwin
//
//  Created by Ibrahim Hamed on 03/02/2023.
//

import Foundation

//MARK: - Request Enums -
enum Server: String {
    case baseURL = "https://laundryapp.org/api/"
}

//MARK: - Errors -
enum APIErrors: String {
    case connectionError
    case canNotDecodeData
}
