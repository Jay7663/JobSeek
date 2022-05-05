import UIKit

/// Authentication Screen sceparater for Options
class DividerLabel: BaseLabel {
    
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
        textColor = UIColor(named: "TFTintColor")
        self.font = UIFont(name: "Poppins-Regular", size: 13)
    }
    
} // End of Class
