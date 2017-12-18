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
//    @IBOutlet weak var searchInput: UISearchBar!
    let searchController = UISearchController(searchResultsController: nil)
    
    var filteredPlants = [Plant]()

    @IBAction func backButton(){
        self.dismiss(animated: true, completion: nil)
    }
    
   // @IBOutlet public var tableView: UITableView!
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String) {
        filteredPlants = plantsService.plants.filter({( plant : Plant) -> Bool in
            return plant.name.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }

    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        plantsService.observe(handler: {plants in
            self.tableView.reloadData()
        })
     
       // let tableView = UITableView(frame: view.bounds)
        //view.addSubview(tableView)
        //self.tableView = tableView
        //

        // Do any additional setup after loading the view.
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Plants"
//        if #available(iOS 11.0, *) {
//            navigationItem.searchController = searchController
//        } else {
            tableView.tableHeaderView = searchController.searchBar
//        }
        definesPresentationContext = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isFiltering() ? filteredPlants.count : plantsService.plants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! PlantTableViewCell
        let p = isFiltering() ? filteredPlants[indexPath.row] : plantsService.plants[indexPath.row]
        cell.nameLabel.text = p.name
        cell.thumbnailImageView.image = UIImage(named: p.photo)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPlantDetail" {
            if let indexPath = tableView?.indexPathForSelectedRow {
                let destinationController = segue.destination as! PlantDetailController
                let p = isFiltering() ? filteredPlants[indexPath.row] : plantsService.plants[indexPath.row]
                destinationController.plant = p
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

extension NewPlantsController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}
