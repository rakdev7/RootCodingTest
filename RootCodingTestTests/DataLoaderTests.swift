//
//  DataLoaderTests.swift
//  RootCodingTestTests
//
//  Created by Rocky on 5/27/20.
//  Copyright © 2020 OrgName. All rights reserved.
//

import XCTest

class DataLoaderTests: XCTestCase {
    var dataLoader = DataLoader()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchDataFromFile() throws {
        let fetchedDriveData = dataLoader.fetchData(from: "MockInput.txt")
        
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
