//
//  PlantDetailController.swift
//  BotanicalGarden
//
//  Created by paraelle on 21.05.2017.
//  Copyright © 2017 paraelle. All rights reserved.
//

import UIKit

class PlantDetailController: UIViewController {
    
    @IBOutlet var plantImageView:UIImageView!
    @IBOutlet var plantNameLabel: UILabel!
    @IBOutlet var plantLatinLabel: UILabel!
    @IBOutlet var plantDetailTextView: UITextView!

    var plantImage = ""
    var plantName = ""
    var plantLatin = ""
    var plantDetail = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        plantImageView.image = UIImage(named: plantImage)
        plantNameLabel.text = plantName
        plantLatinLabel.text = plantLatin
        plantDetailTextView.text = plantDetail

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func backButton(){
        self.dismiss(animated: true, completion: nil)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
