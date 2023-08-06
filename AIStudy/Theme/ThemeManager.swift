//
//  ThemeModel.swift
//  AIStudy
//
//  Created by Matheus Sousa on 04/08/23.
//

import Foundation
import UIKit

class ThemeManager {
    static let shared = ThemeManager()
    private let notificationCenterThemeManager = NotificationCenterThemeManager()
    
    var currentTheme: Theme = .primary {
        didSet {
            UserDefaults.standard.set(currentTheme.rawValue, forKey: K.Keys.keyThemeSelected)
        }
    }
    
    func applyTheme(_ theme: Theme) {
        currentTheme = theme
        notificationCenterThemeManager.inviteThemeChangeNotification()
    }
    
    func setupInitialTheme() {
        let userDefaultTheme = UserDefaults.standard.integer(forKey: K.Keys.keyThemeSelected)

        let selectedTheme = Theme(rawValue: userDefaultTheme)
        
        if let theme = selectedTheme {
            currentTheme = theme
            return
        }
        
        currentTheme = Theme(rawValue: 0)!
    }
}



