//
//  ClassNameProtocol.swift
//  Genwin
//
//  Created by Ibrahim Hamed on 04/02/2023.
//

import Foundation


protocol ClassNameProtocol {
    static var className: String { get }
}
extension ClassNameProtocol {
    static var className: String {
        return String(describing: self)
    }
}
