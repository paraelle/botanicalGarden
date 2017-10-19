//
//  TicketsCell.swift
//  BotanicalGarden
//
//  Created by paraelle on 13.06.2017.
//  Copyright © 2017 paraelle. All rights reserved.
//

import UIKit

class TicketsCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var detailLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
