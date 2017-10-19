//
//  PlantsController.swift
//  BotanicalGarden
//
//  Created by paraelle on 18.05.2017.
//  Copyright © 2017 paraelle. All rights reserved.
//

import UIKit

class PlantsController: UIViewController ,UITableViewDataSource, UITableViewDelegate{

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
    
    var plantNames = ["Amaranth", "Amaryllis", "Anemone", "Aster", "Azalea", "Begonia", "Bellflower", "Bergamot", "Bird of Paradise", "Bluebell", "Bottlebrush", "Buttercup", "Camellias", "Carnation", "Cherry Blossom", "Chrysanthemum", "Clover", "Columbine", "Crocus", "Daisy"]
    
    var plantImages = ["amaranth.jpg", "amaryllis.jpg", "anemone.jpg", "aster.jpg", "azalea.jpg", "begonia.jpg", "bellflower.jpg", "bergamot.jpg", "birdofparadise.jpg", "bluebell.jpg", "bottlebrush.jpg", "buttercup.jpg", "camellias.jpg", "carnation.jpg", "cherryblossom.jpg", "chrysanthemum.jpg", "clover.jpg", "columbine.jpg", "crocus.jpg", "daisy.jpg"]

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plantNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        let plantName = plantNames[indexPath.row]
        cell.textLabel?.text = plantName
        //cell.imageView?.frame.size.height = 10
        //cell.imageView?.frame.size.width = 10
        cell.imageView?.image = UIImage(named: plantName.lowercased())
        return cell
    }

    
/*    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPlantDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! PlantDetailController
                destinationController.plantImage = plantImages[indexPath.row]
                //destinationController.plantName = plantNames[indexPath.row]
            }
        }
    }
*/

  }
