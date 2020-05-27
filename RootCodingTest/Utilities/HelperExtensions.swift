//
//  HelperExtensions.swift
//  RootCodingTest
//
//  Created by Rocky on 5/24/20.
//  Copyright © 2020 OrgName. All rights reserved.
//

import Foundation

let dateFormatter = DateFormatter()

extension String {
    var dateValue: Date? {
        let dateAsString = self
        dateFormatter.dateFormat = "HH:mm"
        let date = dateFormatter.date(from: dateAsString)
        return date
    }
}
