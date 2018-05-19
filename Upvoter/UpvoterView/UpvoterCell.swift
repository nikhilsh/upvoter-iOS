//
//  UpvoterCell.swift
//  Upvoter
//
//  Created by Nikhil Sharma on 19/5/18.
//  Copyright © 2018 nikhil. All rights reserved.
//

import UIKit

class UpvoterCell: UITableViewCell {
    
    var topic: Topic? {
        didSet {
            topicLabel.text = topic?.topicTitle
            // set time
            topicVoteCount.text = String(describing: topic?.voteCount ?? 0)
        }
    }
    
    @IBOutlet weak var topicLabel: UILabel!
    @IBOutlet weak var topicTimePostedLabel: UILabel!
    @IBOutlet weak var topicVoteCount: UILabel!
    
}
