//
//  UIButton + TouchableOpacity.swift
//  AIStudy
//
//  Created by Matheus Sousa on 05/08/23.
//

import Foundation
import UIKit

extension UIButton {
    
    func addOpacity() {
        addTarget(self, action: #selector(buttonPressed), for: .touchDown)
        addTarget(self, action: #selector(buttonReleased), for: .touchUpInside)
        addTarget(self, action: #selector(buttonReleased), for: .touchUpOutside)
        addTarget(self, action: #selector(buttonReleased), for: .touchDragExit)
    }
    
    @objc private func buttonPressed() {
        UIView.animate(withDuration: 0.1) {
            self.alpha = 0.5
        }
    }
    
    @objc private func buttonReleased() {
        UIView.animate(withDuration: 0.1) {
            self.alpha = 1.0
        }
    }
}
