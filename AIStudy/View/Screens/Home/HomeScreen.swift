//
//  HomeScreen.swift
//  AIStudy
//
//  Created by Matheus Sousa on 04/08/23.
//

import UIKit

protocol HomeScreenDelegate: AnyObject {
    func tappedButton()
}

class HomeScreen: UIView {
    
    private weak var delegate: HomeScreenDelegate?
    
    public func delegate(delegate: HomeScreenDelegate?){
        self.delegate = delegate
    }
    
    let theme: ThemeManager = ThemeManager()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(titleLabel)
        self.addSubview(changeThemeButton)
        self.addSubview(secondThemeButton)
        
        self.configConstrainsts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Text for change color"
        label.textColor = .black
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var changeThemeButton = {
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Primary", for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        
        return button
    }()
    
    lazy var secondThemeButton = {
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Second", for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        
        return button
    }()
    
    @objc func tappedButton() {
        self.delegate?.tappedButton()
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    func configConstrainsts() {
        NSLayoutConstraint.activate([
            self.titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -80),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            self.changeThemeButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.changeThemeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.changeThemeButton.heightAnchor.constraint(equalToConstant: 44),
            self.changeThemeButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),
            
            self.secondThemeButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.secondThemeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.secondThemeButton.heightAnchor.constraint(equalToConstant: 44),
            self.secondThemeButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 80),
        ])
        
    }


    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
