//
//  NewPlantsController.swift
//  BotanicalGarden
//
//  Created by paraelle on 06.07.2017.
//  Copyright © 2017 paraelle. All rights reserved.
//

import UIKit

class NewPlantsController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    weak var tableView: UITableView!
    
    @IBAction func backButton(){
        self.dismiss(animated: true, completion: nil)
    }
    
   // @IBOutlet public var tableView: UITableView!

    
    var plantNames = ["Amaranth", "Amaryllis", "Anemone", "Aster", "Azalea", "Begonia", "Bellflower", "Bergamot", "Bird of Paradise", "Bluebell", "Bottlebrush", "Buttercup", "Camellias", "Carnation", "Cherry Blossom", "Chrysanthemum", "Clover", "Columbine", "Crocus", "Daisy"]
    
    var plantImages = ["amaranth.jpg", "amaryllis.jpg", "anemone.jpg", "aster.jpg", "azalea.jpg", "begonia.jpg", "bellflower.jpg", "bergamot.jpg", "bird of paradise.jpg", "bluebell.jpg", "bottlebrush.jpg", "buttercup.jpg", "camellias.jpg", "carnation.jpg", "cherry blossom.jpg", "chrysanthemum.jpg", "clover.jpg", "columbine.jpg", "crocus.jpg", "daisy.jpg"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // let tableView = UITableView(frame: view.bounds)
        //view.addSubview(tableView)
        //self.tableView = tableView

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plantNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! PlantTableViewCell
        
        cell.nameLabel.text = plantNames[indexPath.row]
        cell.thumbnailImageView.image = UIImage(named: plantImages[indexPath.row])
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPlantDetail" {
            if let indexPath = tableView?.indexPathForSelectedRow {
                let destinationController = segue.destination as! PlantDetailController
                destinationController.plantImage = plantImages[indexPath.row]
                destinationController.plantName = plantNames[indexPath.row]
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
