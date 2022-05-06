import UIKit

///  Round Image
@IBDesignable
class BaseImage: UIImageView {
    
    // MARK: - Inspectables
    @IBInspectable var roundedImage: Bool = true {
        didSet {
            self.layer.cornerRadius = self.frame.size.width / 2;
            self.clipsToBounds = true
        }
    }
    
} // End of Class
