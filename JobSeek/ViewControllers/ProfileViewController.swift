import UIKit

class ProfileViewController: UIViewController, Storyboarded {

    // MARK: - Variables
    var coordinator: ProfileCoordinator?
    
    // MARK: - Outlets
    @IBOutlet weak var exprienceView: UIView!
    @IBOutlet weak var educationView: UIView!
    @IBOutlet weak var resumeView: UIView!
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetUp()
    }
    
    // MARK: - Functions
    func initialSetUp() {
        exprienceView.layer.cornerRadius = 20
        educationView.layer.cornerRadius = 20
        resumeView.layer.cornerRadius = 20
    }
    
    // MARK: - Actions
    @IBAction func btnBack(_ sender: UIBarButtonItem) {
        coordinator?.popViewController()
    }
    
} // End of Class
