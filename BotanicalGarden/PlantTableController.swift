//
//  PlantTableController.swift
//  BotanicalGarden
//
//  Created by paraelle on 21.05.2017.
//  Copyright © 2017 paraelle. All rights reserved.
//

import UIKit

class PlantTableController: UITableViewController, UISearchBarDelegate, UISearchDisplayDelegate {

    @IBAction func backButton(){
        self.dismiss(animated: true, completion: nil)
    }
    
    var plantNames = ["Amaranth", "Amaryllis", "Anemone", "Aster", "Azalea", "Begonia", "Bellflower", "Bergamot", "Bird of Paradise", "Bluebell", "Bottlebrush", "Buttercup", "Camellias", "Carnation", "Cherry Blossom", "Chrysanthemum", "Clover", "Columbine", "Crocus", "Daisy"]
    
    var plantImages = ["amaranth.jpg", "amaryllis.jpg", "anemone.jpg", "aster.jpg", "azalea.jpg", "begonia.jpg", "bellflower.jpg", "bergamot.jpg", "bird of paradise.jpg", "bluebell.jpg", "bottlebrush.jpg", "buttercup.jpg", "camellias.jpg", "carnation.jpg", "cherry blossom.jpg", "chrysanthemum.jpg", "clover.jpg", "columbine.jpg", "crocus.jpg", "daisy.jpg"]
    

    
/*    func filterContentForSearchText(searchText: String) {
        // Filter the array using the filter method
        var plantSearchResults = self.plantNames
        if self.plantNames.count == 0 {
            plantSearchResults = nil
            return
        }
        self.plantSearchResults = self.plantNames!.filter({( aPlant: plantNames) -> Bool in
            // to start, let's just search by name
            return aPlant.name!.lowercaseString.rangeOfString(searchText.lowercaseString) != nil
        })
    }
 */

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Make footerview so it fill up size of the screen
        // The button is aligned to bottom of the footerview
        // using autolayout constraints
       // self.tableView.tableFooterView = nil
        //self.footerView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.tableView.frame.size.height - self.tableView.contentSize.height - self.footerView.frame.size.height)
       // self.tableView.tableFooterView = self.footerView
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plantNames.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! PlantTableViewCell
        
        cell.nameLabel.text = plantNames[indexPath.row]
        cell.thumbnailImageView.image = UIImage(named: plantImages[indexPath.row])
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPlantDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! PlantDetailController
                destinationController.plantImage = plantImages[indexPath.row]
                destinationController.plantName = plantNames[indexPath.row]
            }
        }
    }
}
