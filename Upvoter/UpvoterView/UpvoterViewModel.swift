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
        //slice top 20 of array and return
        return topicArray.prefix(20).count
    }
    
    func sortArray(by comparisonProperty: TopicSortingType = .votes, and comparator: (Int, Int) -> Bool) {
        // allow for sorting based on time or votes, depending on what's passed in. Also allow for sorting ascending or descending
        
        topicArray.sort { (a, b) -> Bool in
            switch comparisonProperty {
            case .time:
                return comparator(Int(a.timePosted.timeIntervalSince1970), Int(b.timePosted.timeIntervalSince1970))
            case .votes:
                return comparator(a.voteCount, b.voteCount)
            }
        }
    }
    
    func add(topic: Topic) {
        // default adding elements based on votes
        if let index = topicArray.index(where: { $0.voteCount < topic.voteCount }) {
            topicArray.insert(topic, at: index)
        } else {
            topicArray.append(topic)
        }
    }
    
    func upvote(at index: Int) {
        // simple upvote logic by taking the current vote and adding one. This allows the user to upvote multiple times.
        
        // A more ideal case would be to have a vote object which contains the userid and time voted, which is in the topic. Then when a user wants to vote, first we'll check for the userid in the votes in the topic, if it's not there, we'll upvote and add a new vote object. If it's there, we can retract the vote. Same logic for downvote
        topicArray[index].voteCount += 1
    }
    
    func downvote(at index: Int) {
        topicArray[index].voteCount -= 1
    }
    
}

enum TopicSortingType {
    case time
    case votes
}
