//
//  feedTableViewCell.swift
//  snapChatProject
//
//  Created by Pransu Dash on 3/13/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class feedTableViewCell: UITableViewCell {

    @IBOutlet weak var feedName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        feedName.textAlignment = NSTextAlignment.center
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
