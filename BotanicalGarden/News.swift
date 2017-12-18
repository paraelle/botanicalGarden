//
//  News.swift
//  BotanicalGarden
//
//  Created by paraelle on 17.12.2017.
//  Copyright © 2017 paraelle. All rights reserved.

import Foundation
import Firebase

struct News {
    var title: String
    var details: String
    init(d: NSDictionary) {
        self.title = d["title"] as! String
        self.details = d["details"] as! String
    }
}

class NewsService {
    var newsFeed: [News] = []
    var listeners: [([News]) -> Void] = []
    let newsRef = Firebase.Database.database().reference().child("news")
    
    func observe() {
        newsRef.observe(.value, with: {(snapshot) in
            let values = snapshot.value as! [NSDictionary?]
            for obj in values {
                if let d = obj {
                    self.newsFeed.append(News(d: d))
                }
            }
            self.newsFeed.reverse()
            self.notify()
        })
    }
    func notify() {
        for listener in listeners {
            listener(newsFeed)
        }
    }
    func observe(handler: @escaping ([News]) -> Void) {
        listeners.append(handler) // register listener
        handler(newsFeed) // run once with current value
    }
    init() {
        observe()
    }
}

let newsService = NewsService()
