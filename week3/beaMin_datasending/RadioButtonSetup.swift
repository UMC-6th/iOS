//
//  RadioButtonSetup.swift
//  beaMin_datasending
//
//  Created by 이재용 on 11/15/23.
//

import UIKit
class RadioButton: UIButton {
    var isChecked: Bool = false {
        didSet {
            
            /*
            self.setImage(isChecked ? UIImage(systemName: "circle.inset.filled") : UIImage(systemName: "circle"), for: .normal)
             */
            if isChecked {
                self.setImage(UIImage(systemName: "circle.inset.filled"), for: .normal)
                print("On")
                
            }
            else {
                self.setImage(UIImage(systemName: "circle"), for: .normal)
                print("Off")
            }
        }
    }

    override func awakeFromNib() {
        self.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
    }

    @objc func buttonClicked(sender: UIButton) {
        if sender == self {
          //  isChecked = !isChecked
        }
    }
}

