//
//  PlantTableViewCell.swift
//  BotanicalGarden
//
//  Created by paraelle on 21.05.2017.
//  Copyright © 2017 paraelle. All rights reserved.
//

import UIKit

class PlantTableViewCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var thumbnailImageView:UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
