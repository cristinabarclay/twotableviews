//
//  ViewController.swift
//  twotableviews
//
//  Created by Cristina Barclay on 3/2/20.
//  Copyright © 2020 Cristina Barclay. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

   
    @IBOutlet weak var feed: UITableView!
    @IBOutlet weak var post: UITableView!
    
    var postData : [String] = []
    
    var feedData = [Feed]()
    
    //MARK: Private Methods
     
    private func loadProfilepics() {
        let photo1 = UIImage(named: "pp1")!
        let photo2 = UIImage(named: "pp2")!
        let check = UIImage(named: "check")!
      
       
        
        guard let person1 = Feed(name: "Sara F.", photo: photo1, goal: "Ran 5 miles", completion: check) else {
            fatalError("Unable to instantiate person1")
        }

        guard let person2 = Feed(name: "Alex S.", photo: photo2, goal: "Did 50 pushups", completion: check) else {
            fatalError("Unable to instantiate person2")
        }

        feedData += [person1, person2]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        post.delegate = self
        feed.delegate = self
        post.dataSource = self
        feed.dataSource = self
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numberofRows = 1
        switch tableView {
        case post:
            numberofRows = postData.count
        case feed:
            numberofRows = feedData.count
        default:
            print("something is wrong")
        }
        return numberofRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
     
        
        switch tableView {
        case post:
            var cell = UITableViewCell()
            cell = tableView.dequeueReusableCell(withIdentifier: "postcell", for: indexPath)
            cell.textLabel?.text = postData[indexPath.row]
            cell.backgroundColor = UIColor.green
            return cell
        case feed:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "feedcell", for: indexPath) as? FeedTableViewCell  else {
                fatalError("The dequeued cell is not an instance of feedTableViewCell.")
            }
            let person = feedData[indexPath.row]
            
            cell.ProfileName.text = person.name
            cell.ProfilePic.image = person.photo
            cell.Goal.text = person.goal
            cell.Completion.image = person.completion
        
            return cell
            cell.backgroundColor = UIColor.red
        default:
            print("something is wrong")
        }
       
    }
    



}

