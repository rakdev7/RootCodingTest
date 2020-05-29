//
//  CalculatorTests.swift
//  RootCodingTestTests
//
//  Created by Rocky on 5/27/20.
//  Copyright © 2020 OrgName. All rights reserved.
//

import XCTest

class CalculatorTests: XCTestCase {
    var driveSummaryModel: DriveSummaryModel?
    var mockDriveData: DriveData?
    
    override func setUpWithError() throws {
        mockDriveData = DataLoader().fetchDataFrom(fileName: "MockInput")
        if let mockData = mockDriveData {
            driveSummaryModel = Calculator().calculateDriveSummaries(from: mockData)
        }
    }

    override func tearDownWithError() throws {
        mockDriveData = nil
        driveSummaryModel = nil
    }

    func testCalculatedDriveSummaries() throws {
        XCTAssertNotNil(driveSummaryModel)
    }
    
    func testFilteredTrips() {
        XCTAssertTrue(mockDriveData?.trips.filteredTripsData.count == 3)
    }
    
    func testCalculateTripTime() {
        let startTime = mockDriveData?.trips.trips?.first?.startTime.dateValue
        let endTime = mockDriveData?.trips.trips?.first?.endTime.dateValue
        XCTAssertTrue(Calculator().calculateTripTime(between: startTime, and: endTime) == 0.5)
    }
}
