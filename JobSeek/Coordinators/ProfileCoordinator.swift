import Foundation
import UIKit

class ProfileCoordinator: Coordinator {
    
    var navController: UINavigationController?
    
    init (_ navigationController: UINavigationController) {
        navController = navigationController
    }
    
    func start() {
        let profileVC = ProfileViewController.instantiate(from: .profile)
        profileVC.coordinator = self
        navController?.pushViewController(profileVC, animated: true)
    }
    
    func popViewController() {
        navController?.popViewController(animated: true)
    }
    
    func finish() {
    }
    
    func finishToRoot() {
    }
    
} // End of Class
