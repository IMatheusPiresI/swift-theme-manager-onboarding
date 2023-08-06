//
//  PageOnboarding.swift
//  AIStudy
//
//  Created by Matheus Sousa on 05/08/23.
//

import UIKit

enum ImagesOnboarding {
    case onboarding1,onboarding2,onboarding3

    var imageName: String {
        switch self {
        case .onboarding1:
            return ThemeManager.shared.currentTheme.theme.images.onboarding1
        case .onboarding2:
            return ThemeManager.shared.currentTheme.theme.images.onboarding2
        case .onboarding3:
            return ThemeManager.shared.currentTheme.theme.images.onboarding3
        }
    }
}

class PageOnboardingScreen: UIView {
    
    let notificationCenterThemeManager = NotificationCenterThemeManager()
    var imagePage: ImagesOnboarding?
    
    lazy var titlePageLabel: Typography = {
        let label = Typography(text: "", fontSize: 24, fontFamily: .russoOneRegular, color: .primary)
        
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var currentPageImageView: UIImageView = {
       let image = UIImageView()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    lazy var descriptionPageLabel: Typography = {
        let label = Typography(text: "", fontSize: 14, fontFamily: .robotoMedium, color: .text)
        
        label.textAlignment = .justified
        return label
    }()

    init(title: String, description: String, image: ImagesOnboarding) {
        super.init(frame: .zero)
        self.addSubview(titlePageLabel)
        self.addSubview(currentPageImageView)
        self.addSubview(descriptionPageLabel)
        self.backgroundColor = .clear
        
        self.titlePageLabel.text = title
        self.descriptionPageLabel.text = description
        self.imagePage = image
        self.setupTheme()
        self.configConstraints()
        notificationCenterThemeManager.applyObserver(observer: self, selector: #selector(setupTheme))
    }
    
    deinit{
        notificationCenterThemeManager.removeObserver(observer: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func setupTheme() {
        self.currentPageImageView.image = UIImage(named: imagePage!.imageName)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            self.titlePageLabel.bottomAnchor.constraint(equalTo: self.currentPageImageView.topAnchor, constant: -50),
            self.titlePageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.titlePageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            self.currentPageImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -30),
            self.currentPageImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.currentPageImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.currentPageImageView.heightAnchor.constraint(lessThanOrEqualToConstant: 250),
            
            self.descriptionPageLabel.topAnchor.constraint(equalTo: self.currentPageImageView.bottomAnchor, constant: 20),
            self.descriptionPageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.descriptionPageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }
}
