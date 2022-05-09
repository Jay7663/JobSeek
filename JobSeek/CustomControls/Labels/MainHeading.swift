import UIKit

/// Authentication Screen Main Heading
class MainHeading: BaseLabel {
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        LabelProperties()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        LabelProperties()
    }
    
    // MARK: - Functions
    func LabelProperties() {
        self.textColor = UIColor(red: 0.05, green: 0.05, blue: 0.15, alpha: 1)
        self.font = UIFont(name: "Poppins-SemiBold", size: 28)
    }
    
} // End of Class
