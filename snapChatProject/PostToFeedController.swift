//
//  PostToFeedController.swift
//  snapChatProject
//
//  Created by Pransu Dash on 3/13/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class PostToFeedController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var feedLabel: UILabel!
    
    var img: UIImage!
    var rowSelected: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        feedLabel.text = ""
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return threads.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "feedItem") as! feedTableViewCell
        cell.feedName.text = threadNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        rowSelected = indexPath.row
        feedLabel.text = threadNames[indexPath.row]
    }
    
    @IBAction func sendBtn(_ sender: Any) {
        if feedLabel.text == "" {
            makeAlertError(title: "Error!", message: "Did Not Select Feed", btnTitle: "Try again")
        } else {
            var p: Post = Post()
            p.poster = "Pransu Dash"
            p.timePosted = NSDate.init()
            p.image = img
            p.status = 1
            threads[feedLabel.text!]!.append(p)
            makeAlert(title: "Image Posted!", message: "Posted to " + feedLabel.text!, btnTitle: "Okay")
        }
    }
    
    func sendSuccess() {
        _ = navigationController?.popViewController(animated: true)
    }
    
    func makeAlert(title: String, message: String, btnTitle: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: btnTitle, style: UIAlertActionStyle.default, handler: {action in self.sendSuccess()}))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func makeAlertError(title: String, message: String, btnTitle: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: btnTitle, style: UIAlertActionStyle.default, handler: {action in self.viewDidLoad()}))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
}
