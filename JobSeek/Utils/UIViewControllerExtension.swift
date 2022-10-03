import Foundation
import UIKit

extension UIViewController {
    
    func showAlert(_ message: String ) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
} // End of Extension
