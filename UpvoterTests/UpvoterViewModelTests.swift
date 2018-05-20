//
//  UpvoterViewModelTests.swift
//  UpvoterTests
//
//  Created by Nikhil Sharma on 20/5/18.
//  Copyright © 2018 nikhil. All rights reserved.
//

import XCTest

@testable import Upvoter

class UpvoterViewModelTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRowCount() {
        let subject = UpvoterViewModel()
        XCTAssertEqual(subject.numberOfRows(), 0)
    }
    
    func testRowCountAfterAdding() {
        let subject = UpvoterViewModel()
        subject.topicArray.append(Topic(topicTitle: "test"))
        XCTAssertEqual(subject.numberOfRows(), 1)
    }
    
    func testAddingTopic() {
        let subject = UpvoterViewModel()
        subject.add(topic: Topic(topicTitle: "test"))
        XCTAssertEqual(subject.topicArray.count, 1)
    }
    
    func testAddingTopicOrder() {
        let subject = UpvoterViewModel()
        var topic1 = Topic(topicTitle: "test")
        topic1.voteCount = 1
        var topic2 = Topic(topicTitle: "test2")
        topic2.voteCount = 2
        var topic3 = Topic(topicTitle: "test3")
        topic3.voteCount = 5
        
        //jumble up order of adding topics to array to make sure that
        //highest topic will be at first index
        subject.add(topic: topic2)
        subject.add(topic: topic1)
        subject.add(topic: topic3)
        
        print(subject.topicArray)
        XCTAssertEqual(subject.topicArray[0].topicTitle, topic3.topicTitle)
    }
    
    func testSortingUpvotedTopicOrder() {
        let subject = UpvoterViewModel()
        var topic1 = Topic(topicTitle: "test")
        topic1.voteCount = 1
        var topic2 = Topic(topicTitle: "test2")
        topic2.voteCount = 2
        var topic3 = Topic(topicTitle: "test3")
        topic3.voteCount = 2
        
        subject.add(topic: topic1)
        subject.add(topic: topic2)
        subject.add(topic: topic3)
        
        subject.upvote(at: 2)
        subject.upvote(at: 2)
        
        XCTAssertNotEqual(subject.topicArray[0].topicTitle, topic1.topicTitle)
        subject.sortArray(by: .votes, and: >)
        XCTAssertEqual(subject.topicArray[0].topicTitle, topic1.topicTitle)
    }
    
    func testSortingDownvotedTopicOrder() {
        let subject = UpvoterViewModel()
        var topic1 = Topic(topicTitle: "test")
        topic1.voteCount = 3
        var topic2 = Topic(topicTitle: "test2")
        topic2.voteCount = 2
        var topic3 = Topic(topicTitle: "test3")
        topic3.voteCount = 1
        
        subject.add(topic: topic1)
        subject.add(topic: topic2)
        subject.add(topic: topic3)
        
        subject.downvote(at: 0)
        subject.downvote(at: 0)
        subject.downvote(at: 0)
        
        XCTAssertEqual(subject.topicArray[0].topicTitle, topic1.topicTitle)
        subject.sortArray(by: .votes, and: >)
        XCTAssertEqual(subject.topicArray[0].topicTitle, topic2.topicTitle)
    }
    
    func testSortingTimeTopicOrder() {
        let subject = UpvoterViewModel()
        var topic1 = Topic(topicTitle: "test")
        topic1.voteCount = 2
        topic1.timePosted = Date().addingTimeInterval(5.0)
        var topic2 = Topic(topicTitle: "test2")
        topic2.voteCount = 3
        var topic3 = Topic(topicTitle: "test3")
        topic3.voteCount = 1
        
        subject.add(topic: topic1)
        subject.add(topic: topic2)
        subject.add(topic: topic3)
        
        XCTAssertEqual(subject.topicArray[0].topicTitle, topic2.topicTitle)
        subject.sortArray(by: .time, and: >)
        XCTAssertEqual(subject.topicArray[0].topicTitle, topic1.topicTitle)
    }
    
}
