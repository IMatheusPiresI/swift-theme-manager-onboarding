//
//  ThemeModel.swift
//  AIStudy
//
//  Created by Matheus Sousa on 04/08/23.
//

import Foundation
import UIKit

enum FontTypes {
    case robotoRegular
    case robotoMedium
    case robotoBold
    case russoOneRegular
    
    var font: String {
        switch self {
        case .robotoRegular:
            return K.Theme.Fonts.robotoRegular
        case .robotoMedium:
            return K.Theme.Fonts.robotoMedium
        case .robotoBold:
            return K.Theme.Fonts.robotoBold
        case .russoOneRegular:
            return K.Theme.Fonts.russoOne
        }
    }
}

enum ColorTypes {
    case primary
    case text
    case textAction
    
    var color: UIColor {
        switch self {
        case .primary:
            return ThemeManager.shared.currentTheme.theme.colors.primary
        case .text:
            return ThemeManager.shared.currentTheme.theme.colors.text
        case .textAction:
            return ThemeManager.shared.currentTheme.theme.colors.textAction
        }
    }
}

enum Theme: Int {
    case primary, secondary
    
    var theme: ThemeProtocol {
        switch self {
        case  .primary:
            return ThemeModel.ThemePrimary()
        case .secondary:
            return ThemeModel.ThemeSecondary()
        }
    }
}


struct ThemeModel {
    struct ThemePrimary: ThemeProtocol {
        var colors: ColorsProtocol = ColorsModel(
            primary: UIColor.Theme.Primary.primary,
            background: UIColor.Theme.Primary.background,
            text: UIColor.Theme.Primary.text,
            textAction: UIColor.Theme.Primary.textAction
        )
        
        let images: ImagesProtocol = ImagesModel(
            onboarding1: K.App.Images.onboardingPrimary1,
            onboarding2: K.App.Images.onboardingPrimary2,
            onboarding3: K.App.Images.onboardingPrimary3
        )
    }
    
    struct ThemeSecondary: ThemeProtocol {
        var colors: ColorsProtocol = ColorsModel(
            primary: UIColor.Theme.Secondary.primary,
            background:  UIColor.Theme.Secondary.background,
            text: UIColor.Theme.Secondary.text,
            textAction:  UIColor.Theme.Secondary.textAction
        )
        
        let images: ImagesProtocol = ImagesModel(
            onboarding1: K.App.Images.onboardingSecondary1,
            onboarding2: K.App.Images.onboardingSecondary2,
            onboarding3: K.App.Images.onboardingSecondary3
        )
    }
}
