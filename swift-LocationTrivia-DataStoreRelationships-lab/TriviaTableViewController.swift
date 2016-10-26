//
//  TriviaTableViewController.swift
//  swift-LocationTrivia-DataStoreRelationships-lab
//
//  Created by Paul Tangen on 10/25/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class TriviaTableViewController: UITableViewController {

    @IBOutlet var tableView2: UITableView!
    var store = LocationsDataStore.sharedInstance
    
    var location:Location?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView2.accessibilityLabel = "Trivia Table"
        tableView2.accessibilityIdentifier = "Trivia Table"
        self.tableView2.delegate = self
        self.tableView2.dataSource = self
        
        self.clearsSelectionOnViewWillAppear = false

        let addButton = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addButtonClicked))
        self.navigationItem.rightBarButtonItem = addButton
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView2.reloadData()
    }
    
    @IBAction func addButtonClicked(sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "showAddTrivia", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let location = self.location {
            return location.trivia.count
        }
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView2.dequeueReusableCell(withIdentifier: "prototypeCell", for: indexPath)
        if let location = self.location {
            cell.textLabel?.text = location.trivia[indexPath.row].content
            let detailTextLabel = location.trivia[indexPath.row].likes
            cell.detailTextLabel?.text = String(detailTextLabel)
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination as! AddTriviaViewController
        let selectedIndex = self.tableView2.indexPathForSelectedRow
        if let selectedIndex = selectedIndex {
            destinationViewController.location = store.locations[selectedIndex.row]
        }
    }

}
