//
//  ProfileDesignation.swift
//  JobSeek
//
//  Created by Modhawadiya Jay on 09/05/22.
//

import UIKit

class ProfileDesignation: BaseLabel {

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
        textColor = UIColor(named: "Grey-60")
        self.font = UIFont(name: "Poppins-Regular", size: 12)
    }

} // End of Class
