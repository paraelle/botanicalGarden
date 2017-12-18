//
//  NewsController.swift
//  BotanicalGarden
//
//  Created by paraelle on 13.06.2017.
//  Copyright © 2017 paraelle. All rights reserved.
//

import UIKit

class NewsController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    weak var tableView: UITableView!
    var newsFeed = [News]()
    
    
    @IBAction func backButton(){
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observeNewsFeed()
    }
    
    func observeNewsFeed() {
        newsService.observe(handler: {(feed: [News]) in
            self.newsFeed = feed
            self.tableView.reloadData()
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    /*
     func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
     return UITableViewAutomaticDimension
     }
     */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsFeed.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cellIdentifier = "Cell3"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! NewsCell
        
        cell.titleLabel.text = newsFeed[indexPath.row].title
        cell.detailLabel.text = newsFeed[indexPath.row].details
        cell.detailLabel.numberOfLines = 0
        cell.detailLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        cell.detailLabel.frame.size.width = 280
        cell.detailLabel.frame.size.height = CGFloat(MAXFLOAT)
        cell.detailLabel.sizeToFit()
        // cell.detailLabel.backgroundColor = UIColor(red: 0/255, green: 159/255, blue: 184/255, alpha: 1.0)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 40
        
        /*        if(indexPath.row == 0){
         tableView.rowHeight = 40
         }
         if(indexPath.row == 1 || indexPath.row == 2) {
         tableView.rowHeight = 120
         }
         else {
         tableView.rowHeight = 40
         }
         */
        
        return cell
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

