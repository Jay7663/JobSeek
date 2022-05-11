import UIKit

class LogInViewController: UIViewController, Storyboarded {
    
    // MARK: - Variables
    var coordinator: AuthenticationCoordinator?
    
    // MARK: - Outlets
    @IBOutlet weak var txtEmail: LogInRegisterTextField!
    @IBOutlet weak var txtPassword: LogInRegisterTextField!
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    @IBAction func btnBack(_ sender: UIBarButtonItem) {
        coordinator?.popViewController()
    }
    
    @IBAction func btnRegister(_ sender: ButtonLinkString) {
        coordinator?.popViewController()
    }
    
} // End of Class

// MARK: - UITextFieldDelegate
extension LogInViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case self.txtEmail:
            self.txtPassword.becomeFirstResponder()
        case self.txtPassword:
            self.txtPassword.resignFirstResponder()
        default:
            self.txtPassword.resignFirstResponder()
        }
        return true
    }
    
} // End of Extension
