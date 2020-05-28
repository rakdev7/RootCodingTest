//
//  DataLoaderTests.swift
//  RootCodingTestTests
//
//  Created by Rocky on 5/27/20.
//  Copyright © 2020 OrgName. All rights reserved.
//

import XCTest

class DataLoaderTests: XCTestCase {
    var fetchedDriveData: DriveData?
    override func setUpWithError() throws {
        fetchedDriveData = DataLoader().fetchDataFrom(fileName: "MockInput")
    }

    override func tearDownWithError() throws {
        fetchedDriveData = nil
    }

    func testFetchDataFromFile() throws {
        XCTAssertNotNil(fetchedDriveData)
    }
    
    func testFetchedTrips() {
        XCTAssertTrue(fetchedDriveData?.trips.trips?.count == 5)
    }

    func testFetchedDrivers() {
        XCTAssertTrue(fetchedDriveData?.drivers.drivers?.count == 3)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
