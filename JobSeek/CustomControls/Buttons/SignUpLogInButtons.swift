import UIKit

/// Colored buttons with custom color and text formating
class SignUpLogInButtons: BaseButton {
    
    // MARK: - Variables
    var buttonBackground: UIColor = UIColor(named: "buttonBackground") ?? UIColor.white
    var cornerRadius: CGFloat = 16
    var textColor: UIColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    var fontSize: CGFloat = 16
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialSetUp()
    }
    
    // MARK: - Functions
    func initialSetUp() {
        layer.backgroundColor = buttonBackground.cgColor
        layer.cornerRadius = cornerRadius
        titleLabel?.font = UIFont(name: "Poppins-Medium", size: fontSize)
        titleLabel?.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        self.setTitleColor(textColor, for: .normal)
    }
    
} // End of Class
