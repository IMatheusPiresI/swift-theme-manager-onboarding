//
//  OnboardingScreen.swift
//  AIStudy
//
//  Created by Matheus Sousa on 03/08/23.
//

import UIKit

protocol OnboardingScreenDelegate: AnyObject {
    func skipOnboarding()
    func scrollTonextPageOnboarding()
    func changeTheme()
    func animateAndUpdateUIOnScroll(with: UIScrollView)
}

class OnboardingScreen: UIView {
    
    private weak var delegate: OnboardingScreenDelegate?
    
    public func delegate(delegate: OnboardingScreenDelegate?){
        self.delegate = delegate
    }
    
    lazy var onboardingScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.addSubview(stackHorizontal)
        scrollView.bounces = false
        scrollView.delegate = self
        scrollView.contentInsetAdjustmentBehavior = .never
        
        return scrollView
    }()
    
    lazy var stackHorizontal: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 0
        stackView.addArrangedSubview(pageOne)
        stackView.addArrangedSubview(pageTwo)
        stackView.addArrangedSubview(pageThree)
        
        return stackView
    }()
    
    lazy var pageOne: PageOnboardingScreen = {
        let page = PageOnboardingScreen(title: K.App.Texts.Onboarding.titleFirstPage, description: K.App.Texts.Onboarding.descriptionFirstPage, image: .onboarding1)
        
        page.translatesAutoresizingMaskIntoConstraints = false
        
        return page
    }()
    
    lazy var pageTwo: PageOnboardingScreen = {
        let page = PageOnboardingScreen(title: K.App.Texts.Onboarding.titleSecondPage, description: K.App.Texts.Onboarding.descriptionSecondPage, image: .onboarding2)
        
        page.translatesAutoresizingMaskIntoConstraints = false
        
        return page
    }()
    
    lazy var pageThree: PageOnboardingScreen = {
        let page = PageOnboardingScreen(title: K.App.Texts.Onboarding.titleThirdPage, description: K.App.Texts.Onboarding.descriptionThirdPage, image: .onboarding3)
        
        page.translatesAutoresizingMaskIntoConstraints = false
        
        return page
    }()
    
    lazy var actionStackButtons: UIStackView = {
        let stack = UIStackView()
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .fill
        stack.addArrangedSubview(skipButton)
        stack.addArrangedSubview(onboardingPageControl)
        stack.addArrangedSubview(nextButton)
        return stack
    }()
    
    lazy var skipButton: Button = {
        let button = Button(text: K.App.Texts.skip, fontSize: 14, fontFamily: .robotoMedium, color: .textAction, bgColor: .primary)
        
        button.addTarget(self, action: #selector(skipOnboarding), for: .touchUpInside)
        
        return button
    }()
    
    lazy var nextButton: Button = {
        let button = Button(text: K.App.Texts.next, fontSize: 14, fontFamily: .robotoMedium, color: .textAction, bgColor: .primary)
        
        button.addTarget(self, action: #selector(scrollTonextPageOnboarding), for: .touchUpInside)
        
        return button
    }()
    
    lazy var changeThemeButton: Button = {
        let button = Button(text: K.App.Texts.changetheme, fontSize: 14, fontFamily: .robotoMedium, color: .textAction, bgColor: .primary)
        
        button.isHidden = true
        button.alpha = 0
        button.addTarget(self, action: #selector(changeTheme), for: .touchUpInside)
       
        return button
    }()
    
    lazy var onboardingPageControl: UIPageControl = {
        let pageControl = UIPageControl()
       
        pageControl.numberOfPages = 3
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        return pageControl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(onboardingScrollView)
        self.addSubview(actionStackButtons)
        self.addSubview(changeThemeButton)
        
        self.configConstrainsts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func scrollTonextPageOnboarding() {
        self.delegate?.scrollTonextPageOnboarding()
    }
    
    @objc func skipOnboarding() {
        self.delegate?.skipOnboarding()
    }
    
    @objc func changeTheme() {
        self.delegate?.changeTheme()
    }
    
    func configConstrainsts() {
        NSLayoutConstraint.activate([
            
            self.onboardingScrollView.topAnchor.constraint(equalTo: self.topAnchor),
            self.onboardingScrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.onboardingScrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.onboardingScrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.stackHorizontal.topAnchor.constraint(equalTo: self.onboardingScrollView.topAnchor),
            self.stackHorizontal.leadingAnchor.constraint(equalTo: self.onboardingScrollView.leadingAnchor),
            self.stackHorizontal.trailingAnchor.constraint(equalTo: self.onboardingScrollView.trailingAnchor),
            
            
            self.pageOne.widthAnchor.constraint(equalTo: self.onboardingScrollView.widthAnchor),
            self.pageOne.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            
            self.pageTwo.heightAnchor.constraint(equalTo: self.stackHorizontal.heightAnchor),
            self.pageThree.heightAnchor.constraint(equalTo: self.stackHorizontal.heightAnchor),
            
            self.actionStackButtons.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            self.actionStackButtons.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.actionStackButtons.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            self.nextButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 85),
            self.nextButton.widthAnchor.constraint(lessThanOrEqualToConstant: 100),
            self.nextButton.heightAnchor.constraint(equalToConstant: Button.ButtonSizes.normal.value),
            
            self.skipButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 85),
            self.nextButton.widthAnchor.constraint(lessThanOrEqualToConstant: 100),
            self.skipButton.heightAnchor.constraint(equalToConstant: Button.ButtonSizes.normal.value),
            
            self.changeThemeButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.changeThemeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.changeThemeButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            self.changeThemeButton.heightAnchor.constraint(equalToConstant: Button.ButtonSizes.normal.value)
        ])
    }
    
}

extension OnboardingScreen: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.delegate?.animateAndUpdateUIOnScroll(with: scrollView)
       
    }
}
