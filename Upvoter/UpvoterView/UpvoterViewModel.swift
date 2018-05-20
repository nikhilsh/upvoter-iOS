//
//  UpvoterViewModel.swift
//  Upvoter
//
//  Created by Nikhil Sharma on 19/5/18.
//  Copyright © 2018 nikhil. All rights reserved.
//

import Foundation

class UpvoterViewModel {
    var topicArray = [Topic]()
    
    var numberOfSections: Int = 1
    
    func numberOfRows() -> Int {
        return topicArray.count
    }
    
    func add(topic: Topic) {
        if let index = topicArray.index(where: { $0.voteCount < topic.voteCount }) {
            topicArray.insert(topic, at: index)
        } else {
            topicArray.append(topic)
        }
    }
    
}
