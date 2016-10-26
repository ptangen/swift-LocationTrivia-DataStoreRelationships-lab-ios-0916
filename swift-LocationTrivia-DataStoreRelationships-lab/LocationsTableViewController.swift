//
//  LocationsTableViewController.swift
//  swift-LocationTrivia-DataStoreRelationships-lab
//
//  Created by Paul Tangen on 10/25/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit


class LocationsTableViewController: UITableViewController {

    @IBOutlet var tableview1: UITableView!
    var store = LocationsDataStore.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableview1.delegate = self
        self.tableview1.dataSource = self

        tableview1.accessibilityLabel = "Locations Table"
        tableview1.accessibilityIdentifier = "Locations Table"
        
        self.generateStartingLocationsData()
        
         //Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false

        let addButton = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addButtonClicked))
        self.navigationItem.rightBarButtonItem = addButton
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tableview1.reloadData()
    }

    @IBAction func addButtonClicked(sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "showAddLocation", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.locations.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableview1.dequeueReusableCell(withIdentifier: "prototypeCell", for: indexPath)

        let itemTitle = self.store.locations[indexPath.row].name
        cell.textLabel?.text = itemTitle
        print("cell.textLabel?.text = \(cell.textLabel?.text)")
        
        let detailTextLabel = self.store.locations[indexPath.row].trivia.count
        cell.detailTextLabel?.text = String(detailTextLabel)
      
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showTrivia" {
            let destinationViewController = segue.destination as! TriviaTableViewController
            let selectedIndex = self.tableview1.indexPathForSelectedRow
        
            if let selectedIndex = selectedIndex {
                destinationViewController.location = store.locations[selectedIndex.row]
            }
        }
    }

    func generateStartingLocationsData() {
        
        let empireState = Location(name: "The Empire State Building", latitude: 40.7484, longitude: -73.9857)
        let trivium1A = Trivium(content: "1,454 Feet Tall", likes: 4)
        let trivium1B = Trivium(content: "Cost $24,718,000 to build", likes: 2)
        empireState.trivia.append(contentsOf:[trivium1A, trivium1B])
        
        let bowlingGreen = Location(name: "Bowling Green", latitude: 41.3739, longitude: -83.6508)
        let trivium2A = Trivium(content: "NYC's oldest park", likes: 8)
        let trivium2B = Trivium(content: "Made a park in 1733", likes: 2)
        let trivium2C = Trivium(content: "Charging Bull was created in 1989", likes: 0)
        bowlingGreen.trivia.append(contentsOf:[trivium2A, trivium2B, trivium2C])
        
        let ladyLiberty = Location(name: "Statue Of Liberty", latitude: 40.6892, longitude: -74.0444)
        let trivium3A = Trivium(content: "Gift from France", likes: 6)
        ladyLiberty.trivia.append(trivium3A)
        
        self.store.locations.append(contentsOf:[bowlingGreen, empireState, ladyLiberty])
        self.tableview1.reloadData()
        dump(self.store.locations)
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
