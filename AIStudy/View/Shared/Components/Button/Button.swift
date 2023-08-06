//
//  Button.swift
//  AIStudy
//
//  Created by Matheus Sousa on 04/08/23.
//

import Foundation
import UIKit

class Button: UIButton {
    
    let notificationCenterThemeManager = NotificationCenterThemeManager()
    
    var titleThemeColor: ColorTypes?
    var backgroundThemeColor: ColorTypes?
    var fontFamily: FontTypes?
    var fontSize: Int?
    
    private var heightConstraint: NSLayoutConstraint?
    
    enum ButtonSizes {
        case small, normal, large, custom(Int)
        
        var value: CGFloat {
            switch self {
            case .small:
                return CGFloat(32)
            case .normal:
                return CGFloat(44)
            case .large:
                return CGFloat(56)
            case .custom(let height):
                return CGFloat(height)
            }
        }
    }
    
    init(text: String, fontSize: Int, fontFamily: FontTypes, color: ColorTypes, bgColor: ColorTypes) {
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.titleThemeColor = color
        self.backgroundThemeColor = bgColor
        self.fontFamily = fontFamily
        self.fontSize = fontSize
        self.setTitle(text, for: .normal)
        self.setupTheme()
        self.titleLabel?.adjustsFontSizeToFitWidth = true
        self.titleLabel?.minimumScaleFactor = 0.7
        self.layer.cornerRadius = 12
        self.addOpacity()
        notificationCenterThemeManager.applyObserver(observer: self, selector: #selector(setupTheme))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        notificationCenterThemeManager.removeObserver(observer: self)
    }
    
    @objc func setupTheme() {
        self.titleLabel?.font = UIFont(name: self.fontFamily?.font ?? K.Theme.Fonts.robotoRegular, size: CGFloat(fontSize ?? 14))
        self.backgroundColor = self.backgroundThemeColor?.color
    }
}
