import UIKit

/// Button with attributed text 
@IBDesignable
class ButtonLinkString: BaseButton {
    
    // MARK: - Inspectables
    @IBInspectable var text: String = "" {
        didSet {
            linkStrings()
        }
    }
    
    @IBInspectable var link: String = "" {
        didSet {
            linkStrings()
        }
    }
    
    // MARK: - Functions
    func linkStrings() {
        let mainString = NSMutableAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 0.688, green: 0.692, blue: 0.712, alpha: 1), NSAttributedString.Key.font : UIFont(name: "CircularStd-Book", size: 14) ?? UIFont.systemFont(ofSize: 14)])
        
        let coloredString = NSAttributedString(string: link, attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 0.055, green: 0.616, blue: 0.341, alpha: 1), NSAttributedString.Key.font : UIFont(name: "CircularStd-Book", size: 14) ?? UIFont.systemFont(ofSize: 14)])
        
        mainString.append(coloredString)
        
        self.setAttributedTitle(mainString, for: .normal)
        clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: 18).isActive = true
    }
    
} // End of Class
