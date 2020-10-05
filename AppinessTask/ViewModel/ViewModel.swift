//
//  ViewModel.swift
//  AppinessTask
//
//  Created by HarshaVardhan on 05/10/20.
//  Copyright © 2020 HarshaVardhan. All rights reserved.
//

import Foundation
class DetailsViewModel {
    
    var detailsModel: DetailsModel
    var filteredArray: DetailsModel

    
    init(detailsData: DetailsModel) {
        self.detailsModel = detailsData
        self.filteredArray = detailsData
        let sortedArray = self.filteredArray.details?.sorted{$0.dob?.compare($1.dob!, options: .numeric) == .orderedAscending}
        let nonleapyear = sortedArray?.filter {(sortedObject) -> Bool in
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let dob = sortedObject.dob
            let date = dateFormatter.date(from: dob!)
            let year = Calendar.current.component(.year, from: date!)
            return year % 4 != 0
        }
        self.filteredArray.details = nonleapyear
    }
}
