//
//  PageOnboardingViewController.swift
//  AIStudy
//
//  Created by Matheus Sousa on 05/08/23.
//

import UIKit

class PageOnboardingViewController: UIViewController {

    var screen: OnboardingScreen?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.screen = OnboardingScreen()
        self.view = screen
        // Do any additional setup after loading the view.
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
