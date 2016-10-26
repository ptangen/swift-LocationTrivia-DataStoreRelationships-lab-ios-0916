//
//  LocationsDataStore.swift
//  swift-LocationTrivia-DataStoreRelationships-lab
//
//  Created by Paul Tangen on 10/25/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

final class LocationsDataStore {
    static let sharedInstance = LocationsDataStore()
    private init() {}
    var locations = [Location]()
    //var trivia = [Trivium]()
}

