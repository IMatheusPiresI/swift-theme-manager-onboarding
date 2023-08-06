//
//  Typography.swift
//  AIStudy
//
//  Created by Matheus Sousa on 04/08/23.
//

import Foundation
import UIKit

class Typography: UILabel {
    
    let notificationCenterThemeManager = NotificationCenterThemeManager()
    var labelThemeColor: ColorTypes?
  

    init(text: String, fontSize: Int, fontFamily: FontTypes, color: ColorTypes) {
        super.init(frame: .zero)
        
        self.labelThemeColor = color
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = text
        self.font = UIFont(name: fontFamily.font, size: CGFloat(fontSize))
        self.numberOfLines = 0
        setupTheme()
        
        notificationCenterThemeManager.applyObserver(observer: self, selector: #selector(setupTheme))
    }
    
    deinit {
        notificationCenterThemeManager.removeObserver(observer: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func setupTheme() {
        self.textColor = labelThemeColor?.color
    }
}
