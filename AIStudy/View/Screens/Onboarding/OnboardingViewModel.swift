//
//  OnboardingViewModel.swift
//  AIStudy
//
//  Created by Matheus Sousa on 03/08/23.
//

import Foundation

class OnboardingViewModel {
    var currentPageIndex: Int = 0
    
    func updatePageIndex(to page: Int){
        currentPageIndex = page
    }
}
