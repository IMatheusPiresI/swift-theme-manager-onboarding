//
//  UIColor + Theme.swift
//  AIStudy
//
//  Created by Matheus Sousa on 03/08/23.
//

import Foundation
import UIKit

extension UIColor {
    struct Theme {
        struct Primary {
            static let primary = UIColor(red: 21/255, green: 93/255, blue: 255/255, alpha: 1.0)
            static let background = UIColor(red: 249/255, green: 245/255, blue: 246/255, alpha: 1.0)
            static let text = UIColor(red: 34/255, green: 34/255, blue: 34/255, alpha: 1.0)
            static let textAction = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        }
        
        struct Secondary {
            static let primary = UIColor(red: 219/255, green: 78/255, blue: 222/255, alpha: 1.0)
            static let background = UIColor(red: 249/255, green: 245/255, blue: 246/255, alpha: 1.0)
            static let text = UIColor(red: 34/255, green: 34/255, blue: 34/255, alpha: 1.0)
            static let textAction = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        }
    }
}
