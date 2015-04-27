//
//  SwitchCell.swift
//  Yelp
//
//  Created by Vaibhav Krishna on 4/26/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

@objc protocol SwitchCellDelegate : class{
    optional func swithCell(switchCell: SwitchCell, didChangeValue value: Bool)
}

class SwitchCell: UITableViewCell {

  
    @IBOutlet weak var filterLabel: UILabel!
    
    @IBOutlet weak var filterSwitch: UISwitch!
    
    weak var delegate : SwitchCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        filterSwitch.addTarget(self, action: "swithValChanged", forControlEvents: .ValueChanged)
        
        // Initialization code
    }
    func swithValChanged(){
        delegate?.swithCell?(self, didChangeValue: filterSwitch.on)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
