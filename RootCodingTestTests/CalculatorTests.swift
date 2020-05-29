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
        guard let mockData = mockDriveData else {
            XCTFail("Couldn't load mock drive data for \(self)")
            return
        }
        driveSummaryModel = Calculator().calculateDriveSummaries(from: mockData)
    }

    override func tearDownWithError() throws {
        mockDriveData = nil
        driveSummaryModel = nil
    }

    func testCalculatedDriveSummaries() throws {
        XCTAssertNotNil(driveSummaryModel)
    }
    
    func testDriveSummariesCount() {
        XCTAssertTrue(driveSummaryModel?.driveSummaries?.count == 3)
    }
    
    func testCalculateTripTime() {
        let startTime = mockDriveData?.trips.trips?.first?.startTime.dateValue
        let endTime = mockDriveData?.trips.trips?.first?.endTime.dateValue
        XCTAssertTrue(Calculator().calculateTripTime(between: startTime, and: endTime) == 0.5)
    }
}
