import UIKit

class RegisterViewController: UIViewController, Storyboarded {
    
    // MARK: - Variables
    var coordinator: AuthenticationCoordinator?
    
    // MARK: - Outlets
    @IBOutlet weak var txtFullName: BaseTextField!
    @IBOutlet weak var txtEmail: BaseTextField!
    @IBOutlet weak var txtPassword: BaseTextField!
    @IBOutlet weak var txtConfirmPassword: BaseTextField!
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - File Private Functions
    fileprivate func register(_ email: String, _ password: String) {
        NetworkRequest.call("https://reqres.in/api/register", "POST", UserLogIn(email: email, password: password), RegisterResponse.self) { [weak self] data in
            switch(data) {
            case .success(let result):
                DispatchQueue.main.async {
                    self?.showAlert("Result : \(result.token)")
                    
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.showAlert("Error: \(error.error)")
                }
            }
        }
    }
    
    fileprivate func validateInputs() -> Bool {
        guard let email = txtEmail.text, let password = txtPassword.text, let name = txtFullName.text, let confirmPassword = txtConfirmPassword.text else { return false }
        if(email.isEmpty && password.isEmpty && name.isEmpty && confirmPassword.isEmpty) {
            showAlert("All fields are required")
            return false
        } else if (!(email.contains(".") && email.contains("@"))) {
            showAlert("Wrong email")
            return false
        } else if (password.count < 4) {
            showAlert("Password must be at last 4 char long")
            return false
        } else if (password != confirmPassword) {
            showAlert("Password is not matching")
            return false
        } else {
            return true
        }
    }
    
    // MARK: - Actions
    @IBAction func btnLogIn(_ sender: UIButton) {
        coordinator?.startLogIn()
    }
    
    @IBAction func btnRegister(_ sender: SignUpLogInButtons) {
        if validateInputs() {
            if let email = txtEmail.text, let password = txtPassword.text {
                register(email, password)
            }
        }
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
