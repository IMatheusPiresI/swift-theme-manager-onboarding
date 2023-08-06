//
//  NotificationCenterModel.swift
//  AIStudy
//
//  Created by Matheus Sousa on 04/08/23.
//

import Foundation

class NotificationCenterThemeManager: NotificationCenterThemeProtocol {
    func applyObserver(observer: AnyObject, selector: Selector) {
        let observer: Void =  NotificationCenter.default.addObserver(observer, selector: selector, name: Notification.Name(K.Keys.keyThemeSelected), object: .none)
        
        return observer
    }
    
    func removeObserver(observer: AnyObject){
        let removeObserver: Void = NotificationCenter.default.removeObserver(observer, name: Notification.Name(K.Keys.keyThemeSelected), object: .none)
        
        return removeObserver
    }
    
    func inviteThemeChangeNotification(){
        NotificationCenter.default.post(name: Notification.Name(K.Keys.keyThemeSelected), object: nil)
    }
}
