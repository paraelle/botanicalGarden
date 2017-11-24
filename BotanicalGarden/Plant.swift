//
//  Plant.swift
//  BotanicalGarden
//
//  Created by paraelle on 23.11.2017.
//  Copyright © 2017 paraelle. All rights reserved.
//

import Foundation

struct Plant {
    var id: Int
    var name: String
    var description: String
    var latin_name: String
    var latitude: Double
    var longitude: Double
    var photo: String
    var type: String
    
    init(id: Int, d: NSDictionary) {
        self.id = id
        self.name = d["name"] as! String
        self.description = d["description"] as! String
        self.latin_name = d["latin_name"] as! String
        self.latitude = d["latitude"] as! Double
        self.longitude = d["longitude"] as! Double
        self.photo = d["photo"] as! String
        self.type = d["type"] as! String
    }
}
