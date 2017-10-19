//
//  GardenController.swift
//  BotanicalGarden
//
//  Created by paraelle on 18.05.2017.
//  Copyright © 2017 paraelle. All rights reserved.
//

import UIKit

class GardenController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButton(){
        self.dismiss(animated: true, completion: nil)
    }
    
}
