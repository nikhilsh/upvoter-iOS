//
//  Topic.swift
//  Upvoter
//
//  Created by Nikhil Sharma on 19/5/18.
//  Copyright © 2018 nikhil. All rights reserved.
//

import Foundation

struct Topic {
    let topicTitle: String
    var timePosted: Date
    var voteCount: Int
    
    init(topicTitle: String) {
        self.topicTitle = topicTitle
        self.timePosted = Date()
        self.voteCount = 1
    }
}
