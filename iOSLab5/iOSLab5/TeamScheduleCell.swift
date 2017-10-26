//
//  TeamScheduleCell.swift
//  iOSLab4
//
//  Created by Nguyen, Quang on 10/19/17.
//  Copyright © 2017 Nguyen, Quang. All rights reserved.
//

import UIKit

class TeamScheduleCell: UITableViewCell {

    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var home: UILabel!
    @IBOutlet weak var away: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
