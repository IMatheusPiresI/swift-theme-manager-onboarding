//
//  HomeViewController.swift
//  AIStudy
//
//  Created by Matheus Sousa on 04/08/23.
//

import UIKit

class HomeViewController: UIViewController {

    var screen: HomeScreen?
    var theme = ThemeManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.screen = HomeScreen()
        self.view = screen
        self.screen?.delegate(delegate: self)
        self.setupLayout()
        
        NotificationCenter.default.addObserver(self, selector: #selector(setupLayout), name: Notification.Name(K.App.keyThemeSelected), object: nil)
    }
    

    deinit {
        NotificationCenter.default.removeObserver(self, name: Notification.Name(K.App.keyThemeSelected), object: nil)
    }
    
    @objc func setupLayout() {
        UIView.transition(with: self.view, duration: 0.5, options: .transitionCrossDissolve) {
            self.view.backgroundColor = self.theme.currentTheme.colors.background
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension HomeViewController: HomeScreenDelegate {
    func tappedButton() {
        theme.applyTheme(.primary)
    }
    func tappedGoBack() {
        self.navigationController?.popViewController(animated: true)
    }
}
