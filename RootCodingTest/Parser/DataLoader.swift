//
//  DataLoader.swift
//  RootCodingTest
//
//  Created by Rocky on 5/23/20.
//  Copyright © 2020 OrgName. All rights reserved.
//

import Foundation

struct DataLoaderConstants {
    static let kinputFileType = "txt";
    static let kDriverCommand = "Driver"
    static let kTripCommand = "Trip"
}

//creating a tuple that contains drivers and trips
typealias DriveData = (drivers: DriverModel, trips: TripModel)

class DataLoader {

    final func fetchDataFrom(fileName file: String) -> DriveData? {
        var drivers = [Driver]()
        var trips = [Trip]()
        var driverModel: DriverModel = DriverModel(drivers: nil)
        var tripModel: TripModel = TripModel(trips: nil)
        
        //Loading `input.txt` file from bundle into program memory as a String
        guard let filePath = Bundle.main.path(forResource: file, ofType: DataLoaderConstants.kinputFileType) else { return nil}
        do {
            let data = try String(contentsOfFile: filePath)
            let lines = data.components(separatedBy: .newlines)
            
            for eachLine in lines {
                let words = eachLine.components(separatedBy: .whitespaces)
                if words.first == DataLoaderConstants.kDriverCommand {
                    drivers.append(Driver(name: words[1]))
                } else if words.first == DataLoaderConstants.kTripCommand {
                    guard let milesDriven = Double(words[4]) else { return nil }
                    // Calculates trip time and trip speed for all trips
                    let tripTime = Calculator().calculateTripTime(between: words[2].dateValue, and: words[3].dateValue)
                    let speed = Int((milesDriven/tripTime).rounded())
                    let trip = Trip(driverName: words[1], startTime: words[2], endTime: words[3], milesDriven: milesDriven, tripTime: tripTime, tripSpeed: speed)
                    trips.append(trip)
                }
            }
            
        driverModel = DriverModel(drivers: drivers)
        tripModel = TripModel(trips: trips)
        } catch {
            print(error)
        }
        return (driverModel,tripModel)
    }
}
