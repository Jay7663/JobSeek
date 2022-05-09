import UIKit

class RegisterViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var txtFullName: BaseTextField!
    @IBOutlet weak var txtEmail: BaseTextField!
    @IBOutlet weak var txtPassword: BaseTextField!
    @IBOutlet weak var txtConfirmPassword: BaseTextField!
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    @IBAction func btnLogIn(_ sender: UIButton) {
        //TODO: - Push Login Controller
    }
    
} // End of Class

// MARK: - UITextFieldDelegate
extension RegisterViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case self.txtFullName:
            self.txtEmail.becomeFirstResponder()
        case self.txtEmail:
            self.txtPassword.becomeFirstResponder()
        case self.txtPassword:
            self.txtConfirmPassword.becomeFirstResponder()
        default:
            self.txtConfirmPassword.resignFirstResponder()
        }
        return true
    }

} // End of Extension
