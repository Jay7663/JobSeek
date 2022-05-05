import UIKit

/// Profile Fields SeeAll
class ProfileFieldSeeAllLabel: BaseLabel {

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
        textColor = UIColor(named: "Grey-70")
        self.font = UIFont(name: "Poppins-Regular", size: 13)
    }
    
} // End of Class
