//
//  ViewController.swift
//  RootCodingTest
//
//  Created by Rocky on 5/23/20.
//  Copyright © 2020 OrgName. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    struct ViewControllerConstants {
        static let kinputFileType = "input"
    }
    
    @IBOutlet weak var driveSummariesTableView: UITableView!
    var summary: DriveSummaryModel? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Setting up delegate and data source for table view
        self.driveSummariesTableView.delegate = self
        self.driveSummariesTableView.dataSource = self
        
        //loading data from file and parsing it to the data model
        guard let parsedDriveData = DataLoader().fetchDataFrom(fileName: ViewControllerConstants.kinputFileType) else { return }
        
        //calculating the results from loaded data model above
        summary = Calculator().calculateDriveSummaries(from: parsedDriveData)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = summary?.driveSummaries?.count else { return 0 }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = driveSummariesTableView.dequeueReusableCell(withIdentifier: "driveSummaryCell", for: indexPath)
        guard let currentDriveSummary = summary?.driveSummaries?[indexPath.row] else { return UITableViewCell() }
        //If speed is not available, we don't want to show `mph` string on UI.
        if (currentDriveSummary.speed != nil) {
            guard let speed = currentDriveSummary.speed else { return UITableViewCell() }
            cell.textLabel?.text = "\(currentDriveSummary.driverName): \(currentDriveSummary.totalMiles) miles @ \(speed) mph"
        } else {
            cell.textLabel?.text = "\(currentDriveSummary.driverName): \(currentDriveSummary.totalMiles) miles"
        }
        return cell
    }
}
