//
//  DetailsTableViewCell.swift
//  AppinessTask
//
//  Created by HarshaVardhan on 05/10/20.
//  Copyright © 2020 HarshaVardhan. All rights reserved.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
