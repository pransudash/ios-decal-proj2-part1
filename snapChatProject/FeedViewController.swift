//
//  FeedViewController.swift
//  snapChatProject
//
//  Created by Pransu Dash on 3/13/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    var imgSelected: UIImage!
    var postSelected: Post!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        table.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
//        var i: Int = 0
//        for (_, imgs) in threads {
//            if imgs.count == 0 {
//                continue
//            } else {
//                i += 1
//            }
//        }
//        return i
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return threadNames[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return threads[threadNames[section]]!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "feedsItem", for: indexPath) as! feedsCellView
        let p = threads[threadNames[indexPath.section]]![indexPath.row]
        cell.post = p
        cell.posterName.text = p.poster
        cell.timePosted.text = p.timePosted.description
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "feedsItem", for: indexPath) as! feedsCellView
        var p = threads[threadNames[indexPath.section]]![indexPath.row]
        if p.status > 0 {
            p.status = -1
            cell.post.status = -1
            cell.readStatus.image = UIImage(named: "read")
            postSelected = p
            openPost(post: cell.post)
        }
    }
    
    func openPost(post: Post) {
        print("here")
        performSegue(withIdentifier: "viewImage", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? ViewController {
            dest.post = postSelected
        }
    }

}
