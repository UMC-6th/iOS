//
//  CheckBoxSetup.swift
//  beaMin_datasending
//
//  Created by 이재용 on 11/17/23.
//

import UIKit
class CheckBox: UIButton {
    var isChecked: Bool = false {
        didSet {
            print("did set button state -> ", isChecked)
            if isChecked {
                self.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
                print("On")
                
            }
            else {
                self.setImage(UIImage(systemName: "square"), for: .normal)
                print("Off")
            }
        }
    }

    override func awakeFromNib() {
        self.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
    }

    @objc func buttonClicked(sender: UIButton) {
        if sender == self {
           // isChecked = !isChecked
            print("sender button state -> ", isChecked)
            
        }
    }
}

