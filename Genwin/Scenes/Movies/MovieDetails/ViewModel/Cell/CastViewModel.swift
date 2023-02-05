//
//  CastViewModel.swift
//  Genwin
//
//  Created by Ibrahim Hamed on 05/02/2023.
//

import Foundation


class CastViewModel {
    let image: String
    let name: String
    
    init(cast: Cast?){
//        guard let cast = cast else { return }
        image = cast?.image ?? ""
        name = cast?.name ?? "Unknown"
    }
}
