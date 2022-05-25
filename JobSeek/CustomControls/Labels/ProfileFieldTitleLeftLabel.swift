import UIKit

/// Profile Field title Left side
class ProfileFieldTitleLeftLabel: BaseLabel {

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
        textColor = UIColor(named: "TFTextColor")
        self.font = UIFont(name: "Poppins-SemiBold", size: 14)
    }

} // End of Class
