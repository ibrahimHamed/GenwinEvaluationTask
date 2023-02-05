//
//  Integer.swift
//  Genwin
//
//  Created by Ibrahim Hamed on 05/02/2023.
//

import Foundation

extension Int{
   func rounding(nearest:Float) -> Int{
       return Int(nearest * round(Float(self)/nearest))
    }
}
