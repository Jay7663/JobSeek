import UIKit

/// Authentication Screen Main Heading
class MainHeadingLabel: BaseLabel {
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        labelProperties()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        labelProperties()
    }
    
    // MARK: - Functions
    func labelProperties() {
        self.textColor = UIColor(red: 0.05, green: 0.05, blue: 0.15, alpha: 1)
        self.font = UIFont(name: "Poppins-SemiBold", size: 28)
    }
    
} // End of Class
