//
//  OnboardingViewController.swift
//  AIStudy
//
//  Created by Matheus Sousa on 03/08/23.
//

import UIKit

class OnboardingViewController: BaseViewController {
    
    var screen: OnboardingScreen?
    var viewModel: OnboardingViewModel = OnboardingViewModel()
    var theme = ThemeManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.screen = OnboardingScreen()
        self.view = screen
        self.screen?.delegate(delegate: self)
        self.setupLayout()
    }
    
    override func applyTheme() {
        super.applyTheme()
        self.view.backgroundColor = theme.currentTheme.theme.colors.background
        
        self.screen?.onboardingPageControl.currentPageIndicatorTintColor = theme.currentTheme.theme.colors.primary
        
        self.screen?.onboardingPageControl.pageIndicatorTintColor = theme.currentTheme.theme.colors.text
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func updatePageControl() {
        self.screen?.onboardingPageControl.currentPage = viewModel.currentPageIndex
    }
}

extension OnboardingViewController: OnboardingScreenDelegate {
    func skipOnboarding() {
        print(#function)
    }
    
    func scrollTonextPageOnboarding() {
        let contentOffSet = self.screen?.onboardingScrollView.contentOffset.x ?? 0
        let screenOnboardingWidth = self.screen?.onboardingScrollView.bounds.width ?? 0
        
        let nextPageOffsset = contentOffSet + screenOnboardingWidth
        self.screen?.onboardingScrollView.setContentOffset(CGPoint(x: nextPageOffsset, y: 0), animated: true)
    }
    
    func changeTheme() {
        if theme.currentTheme == .secondary {
            theme.applyTheme(.primary)
            return
        }
        theme.applyTheme(.secondary)
    }
    
    func animateAndUpdateUIOnScroll(with scrollView: UIScrollView) {
        let contentOffset = scrollView.contentOffset.x
        let screenWidth = scrollView.bounds.width
        let currentIndexPage = contentOffset / screenWidth
        let numberCurrentPage = Int(currentIndexPage.rounded(.down))
        viewModel.updatePageIndex(to: numberCurrentPage)
        
        
        
        if currentIndexPage > 1 {
            self.screen?.changeThemeButton.isHidden = false
            self.screen?.actionStackButtons.alpha = 2 - currentIndexPage
            self.screen?.actionStackButtons.transform = CGAffineTransform(translationX: 0, y: (1 - currentIndexPage) * 40)
            
            self.screen?.changeThemeButton.alpha = currentIndexPage - 1
            self.screen?.changeThemeButton.transform = CGAffineTransform(translationX: 0, y:  (2 - currentIndexPage) * 120)
            
            if currentIndexPage == 2 {
                self.screen?.actionStackButtons.isHidden = true
            } else {
                self.screen?.actionStackButtons.isHidden = false
            }
        } else {
            self.screen?.changeThemeButton.isHidden = true
        }
        
        self.updatePageControl()
    }
}
