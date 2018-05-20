[![Build Status](https://www.bitrise.io/app/1c5d1c889eb94af9/status.svg?token=v47oNQ3aNLrCzIESGha03Q&branch=master)](https://www.bitrise.io/app/1c5d1c889eb94af9)

## Upvoter Readme

### Installation
Simply clone the folder, and open the `.xcodeproj`. Hit command - R while pointing to a simulator to run the application

### Usage
Add a new topic by hitting the `+` button on the top right of the viewcontroller. Upvote by sliding the topic cell to the right, downvote by sliding the topic cell to the left. It's that easy!

Vote counts can be found in the top right. Time the topic was submitted is on the bottom right.

### Design

#### Architecture

This application uses an MVVM architecture. This means that there is a viewmodel between the view and the model, and this would mean that there is very little logic in the viewcontroller apart from dealing with the delegate methods from the views. This allows us to test functions in the view model without needed to spin up a view controller

#### Sorting

Sorting is done (for now) upon voting. I've added functionalities to sort by time and vote count (default), as well as to sort ascending or descending. There are more improvements that can be made, by allowing other properties within the Topic model to be equatable and thus allowing sorting through things like alphabetical order. 

A more optimised form of sorting is done with adding topics. By using the default (descending vote count), I look through the topic array to find where to insert the topic. This allows us to skip sorting the entire array as the array should always be sorted


### Tests

The viewmodel is 100% tested, where the logic should reside. I've also added Bitrise CI to run tests when anything is changed on master (push/PR)