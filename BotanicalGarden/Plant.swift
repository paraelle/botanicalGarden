//
//  Plant.swift
//  BotanicalGarden
//
//  Created by paraelle on 23.11.2017.
//  Copyright © 2017 paraelle. All rights reserved.
//

import Foundation
import Firebase

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

class PlantsService {
    var plants: [Plant] = []
    var listeners: [([Plant]) -> Void] = []
    let plantsRef = Firebase.Database.database().reference().child("plants")

    func observePlants() {
        plantsRef.observe(.value, with: {(snapshot) in
            let values = snapshot.value as! [NSDictionary?]
            for (index, obj) in values.enumerated() {
                if let d = obj {
                    self.plants.append(Plant(id: index, d: d))
                }
            }
            self.plants.sort(by: {(a: Plant, b: Plant) in a.name < b.name})
            self.notify();
        })
    }
    func notify() {
        for listener in listeners {
            listener(plants)
        }
    }
    func observe(handler: @escaping ([Plant]) -> Void) {
        listeners.append(handler) // register listener
        handler(plants) // run once with current value
    }
    init() {
        observePlants()
    }
}

let plantsService = PlantsService()
