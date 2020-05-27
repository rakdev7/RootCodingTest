//
//  DriveSummaryModel.swift
//  RootCodingTest
//
//  Created by Rocky on 5/23/20.
//  Copyright © 2020 OrgName. All rights reserved.
//

import Foundation

struct DriveSummaryModel {
    var driveSummaries: [DriveSummary]?
}

struct DriveSummary {
    let driverName: String
    let totalMiles: Int
    let speed: Int?
}
