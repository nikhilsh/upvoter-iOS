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
            topicTimePostedLabel.text = topic?.timePosted.timeAgo()
            topicVoteCount.text = String(describing: topic?.voteCount ?? 0)
        }
    }
    
    @IBOutlet weak var topicLabel: UILabel!
    @IBOutlet weak var topicTimePostedLabel: UILabel!
    @IBOutlet weak var topicVoteCount: UILabel!
    
}

// should be in an extension file but did not want to clutter the files now
extension Date {
    func timeAgo() -> String {
        let interval = Calendar.current.dateComponents([.hour, .minute, .second], from: self, to: Date())
        
        if let hour = interval.hour, hour > 0 {
            return "\(hour)" + " " + "h"
        } else if let minute = interval.minute, minute > 0 {
            return "\(minute)" + " " + "m"
        } else if let second = interval.second, second > 0 {
            return "\(second)" + " " + "s"
        } else {
            return "0s"
        }
        
    }
}
