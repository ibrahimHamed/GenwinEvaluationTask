//
//  BaseViewModel.swift
//  Genwin
//
//  Created by Ibrahim Hamed on 05/02/2023.
//

import Foundation

protocol BaseViewModelProtocol {
    func showIndicator()
    func hideIndicator()
    func showErrorAlert(error: String?)
}


class BaseViewModel : BaseViewModelProtocol{
    func showIndicator() {
        AppIndicator.shared.show(isGif: true)
    }
    
    func hideIndicator() {
        AppIndicator.shared.dismiss()
    }
    
    func showErrorAlert(error: String?) {
        AppAlert.showErrorAlert(error: error)
    }
}
