//
//  Constant.swift
//  Genwin
//
//  Created by Ibrahim Hamed on 03/02/2023.
//

import Foundation

//MARK: - Request Enums -
enum Server: String {
    case baseURL = "https://yts.mx/api/v2/"
}

//MARK: - Errors -
enum APIErrors: String {
    case connectionError = "Please check your connection"
    case canNotDecodeData = "Something wrong please try again later."
}
