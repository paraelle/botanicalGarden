//
//  TicketsController.swift
//  BotanicalGarden
//
//  Created by paraelle on 13.06.2017.
//  Copyright © 2017 paraelle. All rights reserved.
//

import UIKit

class TicketsController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var name = ["Regular", "Concession", "Free", "Personal season pass", "Professional photo shoots"]
    var detail = ["", " - pupils (primary and post-primary schools)\n - students (post-secondary schools)\n - pensioners,\n - the University of Wrocław employees", "- Guests of Honour of the Botanical Garden,\n- preschool children,\n- PTTK guides and teachers leading groups,\n- newlyweds in their wedding gowns,\n- adult disabled visitors with a significant or moderate \n\tdisability level (relevant documents required) and \n\ttheir carers,\n- guide dogs\n- Students from Wroclaw's Univesities during the \n\tacademic year on weekdays and Saturdays \n\t(ID required)", "", ""]
    var price = ["15PLN", "5PLN", "", "200PLN", "200PLN"]
    
    
    @IBAction func backButton(){
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        return name.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cellIdentifier = "Cell2"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TicketsCell
        
        cell.nameLabel.text = name[indexPath.row]
        cell.detailLabel.text = detail[indexPath.row]
        cell.priceLabel.text = price[indexPath.row]
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
