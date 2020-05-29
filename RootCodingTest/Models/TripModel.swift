//
//  TripModel.swift
//  RootCodingTest
//
//  Created by Rocky on 5/23/20.
//  Copyright © 2020 OrgName. All rights reserved.
//

import Foundation

struct TripModel {
    let trips: [Trip]?
    
    // Discards any trips that average a speed of less than 5 mph or greater than 100 mph.
    var filteredTripsData: [Trip] {
        guard let trips = trips else { return [] }
        return trips.filter({ $0.tripSpeed >= 5 && $0.tripSpeed <= 100 })
    }
}

struct Trip {
    let driverName: String
    let startTime: String
    let endTime: String
    let milesDriven: Double
    let tripTime: Double
    let tripSpeed: Int

    init(driverName: String = "", startTime: String = "", endTime: String = "", milesDriven: Double = 0.0, tripTime: Double = 0.0, tripSpeed: Int = 0) {
        self.driverName = driverName
        self.startTime = startTime
        self.endTime = endTime
        self.milesDriven = milesDriven
        self.tripTime = tripTime
        self.tripSpeed = tripSpeed
    }
}
