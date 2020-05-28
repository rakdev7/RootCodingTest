//
//  Calculator.swift
//  RootCodingTest
//
//  Created by Rocky on 5/23/20.
//  Copyright © 2020 OrgName. All rights reserved.
//

import Foundation

struct Calculator {
    func calculateDriveSummaries(from parsedDriveData: DriveData) -> DriveSummaryModel? {
        // Safely extracting Trips Data from DriveData
        guard let allTripsData = parsedDriveData.trips.trips else { return nil }
       
        // Discards any trips that average a speed of less than 5 mph or greater than 100 mph.
        let filteredTrips = allTripsData.filter({$0.tripSpeed>=5 && $0.tripSpeed<=100})
        
        var driveSummaries = [DriveSummary]()
        
        // Safely extracting Drivers Data from DriveData
        guard let allDriversData = parsedDriveData.drivers.drivers else { return nil}
        
        for eachDriverData in allDriversData {
            let currentDriver = eachDriverData.name
            let matchingDriverTrips = filteredTrips.filter({
                $0.driverName == currentDriver
            })
            
            // combining multiple trips from a single driver to get the total miles driven by that driver
            let miles = matchingDriverTrips.map({$0.milesDriven})
            let totalMiles = miles.reduce(0, +)
            
            // combining multiple trips from a single driver to get the total time taken by that driver
            let times = matchingDriverTrips.map({$0.tripTime})
            let totalTimes = times.reduce(0, +)
            
            // calculating speed for each driver from total miles and total time
            var speed: Int?
            if totalTimes > 0 {
            // Round miles per hour a.k.a. `speed` to the nearest integer.
                speed = Int((totalMiles/totalTimes).rounded())
            }
            // Round miles to the nearest integer.
            let intMiles = Int(totalMiles.rounded())
            driveSummaries.append(DriveSummary(driverName: currentDriver, totalMiles: intMiles, speed: speed))
        }
        // Sorting the output by most miles driven to least
        let sortedDrivesummaries = driveSummaries.sorted(by: {$0.totalMiles > $1.totalMiles})
        return DriveSummaryModel(driveSummaries: sortedDrivesummaries)
    }
    
    func calculateTripTime(between startTime:Date?,and endTime:Date?) -> Double {
        guard let startTime = startTime, let endTime = endTime else { return 0}
        // calculate Time difference in seconds
        let difference = Calendar.current.dateComponents([.second], from: startTime, to: endTime)
        guard let duration = difference.second else { return 0}
        // converting trip time from seconds to hours
        let durationInHours = Double(duration)/3600
        return durationInHours
    }
}
