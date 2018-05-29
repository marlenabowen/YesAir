//
//  CityCell.swift
//  YesAir
//
//  Created by Marlena Bowen on 5/17/18.
//  Copyright © 2018 Marlena Bowen. All rights reserved.
//

import UIKit

class CityCell: UITableViewCell {
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var measurementLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
