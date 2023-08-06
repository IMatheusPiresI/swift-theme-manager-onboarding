//
//  BaseViewController.swift
//  AIStudy
//
//  Created by Matheus Sousa on 04/08/23.
//

import UIKit

class BaseViewController: UIViewController {

    let notificationCenterThemeManager = NotificationCenterThemeManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
        // Do any additional setup after loading the view.
        notificationCenterThemeManager.applyObserver(observer: self, selector: #selector(setupLayout))
    }
    
    deinit {
        notificationCenterThemeManager.removeObserver(observer: self)
    }
    
    @objc func setupLayout() {
        UIView.transition(with: self.view, duration: 0.5, options: .transitionCrossDissolve) {
            self.applyTheme()
        }
    }

    func applyTheme() {
        // Implement the logic here to apply color changes to all subviews.
        // For example, you can update the background and text colors of the subviews.
    }

}
