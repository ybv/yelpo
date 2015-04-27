//
//  BusinessCell.swift
//  Yelp
//
//  Created by Vaibhav Krishna on 4/26/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var distLabel: UILabel!
   @IBOutlet weak var filterLabel: UILabel!
    @IBOutlet weak var addLabel: UILabel!
    @IBOutlet weak var revLabel: UILabel!
    @IBOutlet weak var ratingsImageView: UIImageView!
    @IBOutlet weak var restImageView: UIImageView!
    
    var business: Business! {
        didSet{
            nameLabel.text = business.name
            distLabel.text = business.distance
            filterLabel.text = business.categories
            addLabel.text = business.address
            revLabel.text = "\(business.reviewCount!)" + " Reviews"
            ratingsImageView.setImageWithURL(business.ratingImageURL)
            restImageView.setImageWithURL(business.imageURL)
            
        }
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        nameLabel.preferredMaxLayoutWidth = nameLabel.frame.size.width
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        nameLabel.preferredMaxLayoutWidth = nameLabel.frame.size.width
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
