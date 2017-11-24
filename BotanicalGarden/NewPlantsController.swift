//
//  NewPlantsController.swift
//  BotanicalGarden
//
//  Created by paraelle on 06.07.2017.
//  Copyright © 2017 paraelle. All rights reserved.
//

import UIKit
import Firebase


class NewPlantsController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    weak var tableView: UITableView!
    let plantsRef = Firebase.Database.database().reference().child("plants")
    
    @IBAction func backButton(){
        self.dismiss(animated: true, completion: nil)
    }
    
   // @IBOutlet public var tableView: UITableView!
    
    var plants : [Plant] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        observePlants()
     
       // let tableView = UITableView(frame: view.bounds)
        //view.addSubview(tableView)
        //self.tableView = tableView

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func observePlants() {
        plantsRef.observe(.value, with: {(snapshot) in
            let values = snapshot.value as! [NSDictionary?]
            for var (index, obj) in values.enumerated() {
                if let d = obj {
                    self.plants.append(Plant(id: index, d: d))
                }
            }
            print(self.plants)
            
            self.tableView.reloadData()
        })
    }
 
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! PlantTableViewCell
        
        cell.nameLabel.text = plants[indexPath.row].name
        cell.thumbnailImageView.image = UIImage(named: plants[indexPath.row].photo)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMapSegue" {
            let destinationController = segue.destination as! MapController
            destinationController.plants = self.plants
        }
        if segue.identifier == "showPlantDetail" {
            if let indexPath = tableView?.indexPathForSelectedRow {
                let destinationController = segue.destination as! PlantDetailController
                destinationController.plantImage = plants[indexPath.row].photo
                destinationController.plantName = plants[indexPath.row].name
                destinationController.plantLatin = plants[indexPath.row].latin_name
                destinationController.plantDetail = plants[indexPath.row].description
            }
        }
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
