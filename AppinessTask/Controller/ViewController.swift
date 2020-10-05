//
//  ViewController.swift
//  AppinessTask
//
//  Created by HarshaVardhan on 05/10/20.
//  Copyright © 2020 HarshaVardhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var detailsTableView: UITableView!
    var detailsViewModel: DetailsViewModel?
    var sortedDates = ""
    var sortedDatesArray = [String]()
    // MARK: View Life Cycle Methods.
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "Values", withExtension: "json"),
            let data = try? Data(contentsOf: url) else {
                return
        }
        
        let decoder = JSONDecoder()
        guard let launch = try? decoder.decode(DetailsModel.self, from: data) else {
            return
        }
        self.detailsViewModel = DetailsViewModel.init(detailsData: launch)
    }
}
// MARK: Table View Delegate abd DataSource Methods.
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.detailsViewModel?.filteredArray.details?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsCell") as! DetailsTableViewCell
     
        cell.dobLabel.text = self.detailsViewModel?.filteredArray.details![indexPath.row].dob ?? ""
        cell.nameLabel.text = self.detailsViewModel?.filteredArray.details![indexPath.row].name ?? ""
        return cell
    }
}

