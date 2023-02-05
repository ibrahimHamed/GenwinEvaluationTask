//
//  BaseVC.swift
//  Genwin
//
//  Created by Ibrahim Hamed on 04/02/2023.
//

import UIKit

class BaseVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func setupStatusBar(color: UIColor) {
        if #available(iOS 13.0, *) {
            let window = UIApplication.shared.windows.first
            let topPadding = window?.safeAreaInsets.top
            let statusbarView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: topPadding ?? 0.0))
            statusbarView.backgroundColor = color
            statusbarView.tag = 1
            UIApplication.shared.windows.filter { $0.isKeyWindow }.first?.addSubview(statusbarView)
        } else {
            let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView
            statusBar?.tag = 1
            statusBar?.backgroundColor = color
        }
    }
}
