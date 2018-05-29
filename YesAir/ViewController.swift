//
//  ViewController.swift
//  YesAir
//
//  Created by Marlena Bowen on 5/17/18.
//  Copyright © 2018 Marlena Bowen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        getAirQualityData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func getAirQualityData() {
        let url = URL(string: "https://api.openaq.org/v1/cities?order_by=count&sort=desc&limit=10000")!
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            func displayError(_ error: String) {
                print(error)
                print("URL at time of error: \(url)")
            }
            
            if error == nil {
                if let data = data {
                    let parsedResult: NSDictionary!
                    do {
                        parsedResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! NSDictionary
                    } catch {
                        displayError("Could not parse the data as JSON: '\(data)'")
                        return
                    }
                    let results = parsedResult["results"] as! NSArray
                    City.cityArray(results: results)
                }
            }
            self.reloadOnMain()
        }
        task.resume()
    }
    
    func reloadOnMain() {
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AllCities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CityCell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath) as! CityCell
        cell.cityLabel.text = AllCities[indexPath.row].name
        cell.measurementLabel.text = String(AllCities[indexPath.row].count)
        return cell
    }
}

