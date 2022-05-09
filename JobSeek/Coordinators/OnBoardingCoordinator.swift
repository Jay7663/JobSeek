//
//  OnBoardingCoordinator.swift
//  JobSeek
//
//  Created by Modhawadiya Jay on 12/05/22.
//

import Foundation
import UIKit

class OnBoardingCoordinator: Coordinator {
    
    var navController: UINavigationController?
    
    init (_ navigationController: UINavigationController) {
        navController = navigationController
    }
    
    func start() {
        let onBoardingVC = OnBoardingViewController.instantiate(from: .onBoarding)
        onBoardingVC.coordinator = self
        navController?.pushViewController(onBoardingVC, animated: true)
    }
    
    func startAuthentication() {
        if let navController = navController {
            let authenticationVC = AuthenticationCoordinator(navController)
            authenticationVC.start()
        }
    }
    
    func popViewController() {
        navController?.popViewController(animated: true)
    }
    
    func finish() {
    }
    
    func finishToRoot() {
    }
    
}//End of class
