//
//  AppIndicator.swift
//  Genwin
//
//  Created by Ibrahim Hamed on 05/02/2023.
//

import UIKit

class AppIndicator {
    
    //MARK: - properties -
    private let indicatorContainer: UIView  = UIView()
    private let indicatorView: UIView = UIView()
    private let indicatorImageView: UIImageView = UIImageView()
    private let length: CGFloat = UIScreen.main.bounds.width * 0.2
    private let innerLength: CGFloat = UIScreen.main.bounds.width * 0.2
    private let duration: TimeInterval = 1.4
    private var timer: Timer?
    private let tag: Int = 19920301
    
    static let shared: AppIndicator = AppIndicator()
    
    //MARK: - Initializer -
    private init() {}
    
    
    //MARK: - Private Methods -
    private func handleInitialView() {
        
        self.indicatorContainer.tag = self.tag
        self.indicatorContainer.alpha = 0
        self.indicatorContainer.backgroundColor = .black.withAlphaComponent(0.2)
        self.indicatorView.backgroundColor = .clear
        self.indicatorImageView.contentMode = .scaleAspectFit
        self.indicatorImageView.image = UIImage.gifImageWithName("indicatorGifImage")
        
        self.indicatorView.addSubview(self.indicatorImageView)
        self.indicatorContainer.addSubview(self.indicatorView)
        let window = UIApplication.shared.windows.first { $0.isKeyWindow }
        guard let window = window else {return}
        window.addSubview(self.indicatorContainer)
        
        //MARK:- Add constraints
        self.indicatorContainer.translatesAutoresizingMaskIntoConstraints = false
        self.indicatorView.translatesAutoresizingMaskIntoConstraints = false
        self.indicatorImageView.translatesAutoresizingMaskIntoConstraints = false
        self.indicatorImageView.layer.cornerRadius = 15
        self.indicatorImageView.clipsToBounds = true
        
        self.indicatorContainer.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height).isActive = true
        self.indicatorContainer.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        
        self.indicatorView.heightAnchor.constraint(equalToConstant: self.length).isActive = true
        self.indicatorView.widthAnchor.constraint(equalToConstant: self.length).isActive = true
        self.indicatorView.centerYAnchor.constraint(equalTo: self.indicatorContainer.centerYAnchor).isActive = true
        self.indicatorView.centerXAnchor.constraint(equalTo: self.indicatorContainer.centerXAnchor).isActive = true
        
        self.indicatorImageView.heightAnchor.constraint(equalToConstant: self.innerLength).isActive = true
        self.indicatorImageView.widthAnchor.constraint(equalToConstant: self.innerLength).isActive = true
        self.indicatorImageView.centerYAnchor.constraint(equalTo: self.indicatorView.centerYAnchor).isActive = true
        self.indicatorImageView.centerXAnchor.constraint(equalTo: self.indicatorView.centerXAnchor).isActive = true
        
        
        
    }
    private func startTimer() {
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 0.0, target: self, selector: #selector(self.startAnimate), userInfo: nil, repeats: false
            )
        }
    }
    private func stopTimer() {
        self.timer?.invalidate()
        timer = nil
    }
    @objc private func startAnimate() {
        self.indicatorImageView.rotate(duration: self.duration)
    }
    @objc private func stopAnimate() {
        self.stopTimer()
    }
    
    //MARK: - Action Methods -
    func show() {
        self.handleInitialView()
        UIView.animate(withDuration: 0.3) {
            self.indicatorContainer.alpha = 1
        }
    }
    func dismiss() {
        let window = UIApplication.shared.windows.first { $0.isKeyWindow }
        guard let window = window else {return}
        UIView.animate(withDuration: 0.2) {
            window.viewWithTag(self.tag)?.alpha = 0
        } completion: { _ in
            self.stopAnimate()
            window.viewWithTag(self.tag)?.removeFromSuperview()
        }
    }
    
}

extension UIView {
    private static let kRotationAnimationKey = "rotationanimationkey"

    func rotate(duration: Double = 1) {
        if layer.animation(forKey: UIView.kRotationAnimationKey) == nil {
            let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")

            rotationAnimation.fromValue = 0.0
            rotationAnimation.toValue = Float.pi * 2.0
            rotationAnimation.duration = duration
            rotationAnimation.repeatCount = Float.infinity

            layer.add(rotationAnimation, forKey: UIView.kRotationAnimationKey)
        }
    }

    func stopRotating() {
        if layer.animation(forKey: UIView.kRotationAnimationKey) != nil {
            layer.removeAnimation(forKey: UIView.kRotationAnimationKey)
        }
    }
}
