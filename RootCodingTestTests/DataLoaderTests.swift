//
//  DataLoaderTests.swift
//  RootCodingTestTests
//
//  Created by Rocky on 5/27/20.
//  Copyright © 2020 OrgName. All rights reserved.
//

import XCTest

class DataLoaderTests: XCTestCase {

    func testFetchDataFromFileNotNil() throws {
        let fetchedDriveData = DataLoader().fetchDataFrom(fileName: "MockInput")
        XCTAssertNotNil(fetchedDriveData)
    }
    
    func testFetchedTrips() {
        let fetchedDriveData = DataLoader().fetchDataFrom(fileName: "MockInput")
        XCTAssertTrue(fetchedDriveData?.trips.trips?.count == 5)
    }

    func testFetchedDrivers() {
        let fetchedDriveData = DataLoader().fetchDataFrom(fileName: "MockInput")
        XCTAssertTrue(fetchedDriveData?.drivers.drivers?.count == 3)
    }
    
    func testFetchDataFromFileNil() throws {
        let fetchedDriveData = DataLoader().fetchDataFrom(fileName: "WrongFileName")
        XCTAssertNil(fetchedDriveData)
    }
    
    func testCorruptInputFile() {
        let fetchedDriveData = DataLoader().fetchDataFrom(fileName: "CorruptMockInput")
        XCTAssertNil(fetchedDriveData)
    }
}
