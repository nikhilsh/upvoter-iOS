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
}
