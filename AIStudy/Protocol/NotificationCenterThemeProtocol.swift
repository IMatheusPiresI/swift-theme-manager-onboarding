//
//  NotificationCenterThemeProtocol.swift
//  AIStudy
//
//  Created by Matheus Sousa on 05/08/23.
//

import Foundation

protocol NotificationCenterThemeProtocol {
    func applyObserver(observer: AnyObject, selector: Selector)
    func removeObserver(observer: AnyObject)
    func inviteThemeChangeNotification()
}
