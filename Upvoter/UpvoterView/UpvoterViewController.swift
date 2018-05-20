//
//  UpvoterViewController.swift
//  Upvoter
//
//  Created by Nikhil Sharma on 19/5/18.
//  Copyright © 2018 nikhil. All rights reserved.
//

import UIKit

class UpvoterViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    lazy var upvoterViewModel: UpvoterViewModel = {
        // add delegate if needed
        return UpvoterViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        setupViews()
        setupNewTopicButton()
    }
    
    func setupViews() {
        self.title = "Upvoter"
    }
    
    func setupNewTopicButton() {
        let addTopicButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewTopic))
        
        self.navigationItem.rightBarButtonItem = addTopicButton
    }
    
    @objc func addNewTopic() {
        let alert = UIAlertController(title: "Topic", message: "Please enter the title of your topic", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { (alertaction) in
            let textfield = alert.textFields![0] as UITextField
            guard let topicString = textfield.text else {
                return
            }
            self.upvoterViewModel.add(topic: Topic(topicTitle: topicString))
            self.tableView.reloadData()
        }
        alert.addTextField { (textfield) in
            textfield.placeholder = "Enter your topic"
            textfield.delegate = self
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}

extension UpvoterViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return upvoterViewModel.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return upvoterViewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "upvoterCell", for: indexPath) as? UpvoterCell else {
            return UITableViewCell()
        }
        cell.topic = self.upvoterViewModel.topicArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let upvoteAction = UIContextualAction(style: .normal, title: "Upvote") { (action, view, success) in
            self.upvoterViewModel.upvote(at: indexPath.row)
            self.upvoterViewModel.sortArray(by: TopicSortingType.votes, and: >)
            tableView.reloadData()
            success(true)
        }
        upvoteAction.image = UIImage(named: "icon_up")
        upvoteAction.backgroundColor = .green
        
        return UISwipeActionsConfiguration(actions: [upvoteAction])
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let downvoteAction = UIContextualAction(style: .normal, title: "Downvote") { (action, view, success) in
            self.upvoterViewModel.downvote(at: indexPath.row)
            self.upvoterViewModel.sortArray(by: TopicSortingType.time, and: >)
            tableView.reloadData()
            success(true)
        }
        downvoteAction.image = UIImage(named: "icon_down")
        downvoteAction.backgroundColor = .red
        
        return UISwipeActionsConfiguration(actions: [downvoteAction])
    }
}

extension UpvoterViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let currentString = textField.text as NSString? {
            let newString = currentString.replacingCharacters(in: range, with: string) as NSString
            return newString.length <= 255
        }
        return true
    }
}
