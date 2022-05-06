import UIKit

/// Authentication Screen sceparater for Options
class ThirdLabel: BaseLabel {
    
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
    func LabelProperties(){
        textColor = UIColor(named: "TFTintColor")
        self.font = UIFont(name: "Poppins-Regular", size: 13)
    }
    
} // End of Class
