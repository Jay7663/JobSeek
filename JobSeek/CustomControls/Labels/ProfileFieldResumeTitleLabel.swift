import UIKit

/// Profile Field Resume title
class ProfileFieldResumeTitleLabel: BaseLabel {

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
        self.font = UIFont(name: "Poppins-Bold", size: 11)
    }
    
} // End of Class
