import UIKit

/// Profile designation of user
class ProfileDesignationLabel: BaseLabel {

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
        self.font = UIFont(name: "Poppins-Regular", size: 12)
    }

} // End of Class
