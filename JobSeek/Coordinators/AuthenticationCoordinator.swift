import Foundation
import UIKit

class AuthenticationCoordinator: Coordinator {
    
    var navController: UINavigationController?
    
    init (_ navigationController: UINavigationController) {
        navController = navigationController
    }
    
    func start() {
        let registerVC = RegisterViewController.instantiate(from: .authentication)
        registerVC.coordinator = self
        navController?.viewControllers = []
        navController?.pushViewController(registerVC, animated: true)
    }
    
    func startLogIn() {
        let logInVC = LogInViewController.instantiate(from: .authentication)
        logInVC.coordinator = self
        navController?.pushViewController(logInVC, animated: true)
    }
    
    func popViewController() {
        navController?.popViewController(animated: true)
    }
    
    func finish() {
    }
    
    func finishToRoot() {
    }
    
} //End of class
