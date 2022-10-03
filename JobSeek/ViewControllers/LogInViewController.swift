import UIKit

class LogInViewController: BaseViewController, Storyboarded {
    
    // MARK: - Variables
    var coordinator: AuthenticationCoordinator?
    var isValidUser = false
    
    // MARK: - Outlets
    @IBOutlet weak var txtEmail: LogInRegisterTextField!
    @IBOutlet weak var txtPassword: LogInRegisterTextField!
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - File Private Functions
    fileprivate func logIn(_ email: String, _ password: String) {
        NetworkRequest.call("https://reqres.in/api/login", "POST", UserLogIn(email: email, password: password), LogInResponse.self) { [weak self] data in
            switch(data) {
            case .success(let result):
                DispatchQueue.main.async {
                    self?.showAlert(result.token)
                    self?.coordinator?.startProfile()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.showAlert(error.error)
                }
            }
        }
    }
    
    fileprivate func validateInputs() -> Bool {
        guard let email = txtEmail.text, let password = txtPassword.text else { return false }
        if(email.isEmpty && password.isEmpty) {
            showAlert("All fields are required")
            return false
        } else if (!(email.contains(".") && email.contains("@"))) {
            showAlert("Wrong email")
            return false
        } else if (password.count < 4) {
            showAlert("Password must be at last 4 char long")
            return false
        } else {
            return true
        }
    }
    
    // MARK: - Actions
    @IBAction func btnBack(_ sender: UIBarButtonItem) {
        coordinator?.popViewController()
    }
    
    @IBAction func btnRegister(_ sender: ButtonLinkString) {
        coordinator?.popViewController()
    }
    
    @IBAction func btnLogIn(_ sender: SignUpLogInButtons) {
        if validateInputs() {
            if let email = txtEmail.text, let password = txtPassword.text {
                logIn(email, password)
            }
        }
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
