//
//  ObservableObject.swift
//  Genwin
//
//  Created by Ibrahim Hamed on 04/02/2023.
//

import Foundation

final class ObservableObject<T> {
    private var listener: ((T?) -> Void)?

    var value: T? {
        didSet {
            listener?(value)
        }
    }

    init(_ value: T? = nil) {
        self.value = value
    }

    func bind(_ listener: @escaping (T?) -> Void) {
        listener(value)
        self.listener = listener
    }
}
