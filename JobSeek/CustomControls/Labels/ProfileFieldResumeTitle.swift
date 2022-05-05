//
//  ProfileFieldResumeTitle.swift
//  JobSeek
//
//  Created by Modhawadiya Jay on 09/05/22.
//

import UIKit

class ProfileFieldResumeTitle: BaseLabel {

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
        textColor = UIColor(named: "TFTextColor")
        self.font = UIFont(name: "Poppins-Bold", size: 11)
    }

} // End of Class
