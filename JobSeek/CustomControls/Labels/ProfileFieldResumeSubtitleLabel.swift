import UIKit

/// Profile Field Resume subtitle
class ProfileFieldResumeSubtitleLabel: BaseLabel {

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
        textColor = UIColor(named: "Grey-60")
        self.font = UIFont(name: "Poppins-Regular", size: 8)
    }

} // End of Class
