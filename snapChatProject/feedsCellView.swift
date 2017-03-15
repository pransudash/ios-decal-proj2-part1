//
//  feedsCellView.swift
//  snapChatProject
//
//  Created by Pransu Dash on 3/13/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class feedsCellView: UITableViewCell {

    @IBOutlet weak var posterName: UILabel!
    @IBOutlet weak var timePosted: UILabel!
    @IBOutlet weak var readStatus: UIImageView!
    var post: Post! = Post()
    var img: UIImage!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        readStatus.image = UIImage(named: "unread")
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
