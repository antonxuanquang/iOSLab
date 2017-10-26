//
//  ViewController.swift
//  iOSLab4
//
//  Created by Nguyen, Quang on 10/19/17.
//  Copyright © 2017 Nguyen, Quang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var teamNameTable: UITableView!
    
    var teamNames: [String]!
    var selectedTeam: String!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        teamNameTable.delegate = self
        teamNameTable.dataSource = self
        
        teamNames = ["Baylor", "Iowa State", "Kansas", "Kansas State", "Oklahoma", "Oklahoma State", "TCU", "Texas", "Texas Tech", "West Virginia"]
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "teamNameCell")
        cell.textLabel?.text = teamNames[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamNames.count
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedTeam = teamNames[indexPath.row]
        performSegue(withIdentifier: "teamDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let teamDetailController = segue.destination as! TeamDetailController
        teamDetailController.selectedTeam = self.selectedTeam
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

