//
//  AddLocationUIViewController.swift
//  swift-LocationTrivia-DataStoreRelationships-lab
//
//  Created by Paul Tangen on 10/25/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class AddLocationUIViewController: UIViewController {
    var store = LocationsDataStore.sharedInstance
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var latitudeField: UITextField!
    @IBOutlet weak var longitudeField: UITextField!
    
    @IBAction func cancelButton(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: {});
    }
    
    @IBAction func saveButton(_ sender: AnyObject) {
        let newLocation = Location(name: nameField.text!, latitude: Float(latitudeField.text!)!, longitude: Float(longitudeField.text!)!)
        store.locations.append(newLocation)
        self.dismiss(animated: true, completion: {})

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
