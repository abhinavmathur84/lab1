//
//  TumblrViewCell.swift
//  Tumblr
//
//  Created by Abhinav Mathur on 7/14/16.
//  Copyright © 2016 Abhinav Mathur. All rights reserved.
//

import UIKit
import AFNetworking

class TumblrViewCell: UITableViewCell {

    @IBOutlet weak var tumblrImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
