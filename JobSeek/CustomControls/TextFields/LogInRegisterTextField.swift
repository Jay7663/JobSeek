import UIKit

/// TextFields for Login and Registration screen
@IBDesignable
class LogInRegisterTextField: BaseTextField {
    
    // MARK: - Variables
    var padding = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 0)
    var textFieldBorderColor: UIColor = UIColor(named: "TFTextColor") ?? UIColor.red
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialSetUp()
    }
    
    // MARK: - Inspectables
    @IBInspectable var startImage: UIImage? {
        didSet {
            initialSetUp()
        }
    }
    
    @IBInspectable var endImage: UIImage? {
        didSet {
            initialSetUp()
        }
    }
    
    // MARK: - Functions
    func initialSetUp() {
        if let image = startImage {
            leftViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            leftView = imageView
        } else {
            leftViewMode = UITextField.ViewMode.never
            leftView = nil
        }
        
        if let endImage = endImage {
            rightViewMode = UITextField.ViewMode.always
            let btnHideShow = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            btnHideShow.setImage(endImage, for: .normal)
            btnHideShow.contentMode = .scaleAspectFit
            btnHideShow.addTarget(self, action: #selector(btnHideShowTapped), for: .touchUpInside)
            rightView = btnHideShow
        } else {
            rightViewMode = UITextField.ViewMode.never
            rightView = nil
        }
        
        // Placeholder text color
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: UIColor(red: 0.688, green: 0.692, blue: 0.712, alpha: 1)])
        
        self.layer.borderWidth = 1
        self.layer.borderColor = textFieldBorderColor.cgColor
        self.layer.cornerRadius = 12
        self.clipsToBounds = clipsToBounds
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        self.font = UIFont(name: "Poppins-Medium", size: 14)
        self.textColor = UIColor(named: "TFTextColor")
        tintColor = UIColor(named: "TFTintColor")
    }
    
    @objc func btnHideShowTapped() {
        isSecureTextEntry = !isSecureTextEntry
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        let textRect = super.rightViewRect(forBounds: bounds)
        return textRect.inset(by: UIEdgeInsets(top: 0, left: -30, bottom: 0, right: 0))
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        let textRect = super.leftViewRect(forBounds: bounds)
        return textRect.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 0, right:-35))
    }
    
} // End of Class
