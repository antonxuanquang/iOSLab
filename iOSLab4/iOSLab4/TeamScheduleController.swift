//
//  TeamScheduleController.swift
//  iOSLab4
//
//  Created by Nguyen, Quang on 10/19/17.
//  Copyright © 2017 Nguyen, Quang. All rights reserved.
//

import UIKit

class TeamScheduleController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var teamScheduleTable: UITableView!
    var selectedTeam: String!
    var teamSchedule: [[String]]!
    var completeSchedule: [[String]] = [
        ["Thu, Aug 31", "Tulsa", "Oklahoma State"],
        ["Sat, Sep 02", "Maryland", "Texas"],
        ["Sat, Sep 02", "UTEP", "Oklahoma"],
        ["Sat, Sep 02", "Eastern Washington", "Texas Tech"],
        ["Sat, Sep 02", "Liberty", "Baylor"],
        ["Sat, Sep 02", "Central Arkansas", "Kansas State"],
        ["Sat, Sep 02", "Southeast Missouri State", "Kansas"],
        ["Sat, Sep 02", "Jackson State", "TCU"],
        ["Sat, Sep 02", "Northern Iowa", "Iowa State"],
        ["Sun, Sep 03", "Virginia Tech", "West Virginia"],
        ["Fri, Sep 08", "Oklahoma State", "South Alabama"],
        ["Sat, Sep 09", "Iowa", "Iowa State"],
        ["Sat, Sep 09", "East Carolina", "West Virginia"],
        ["Sat, Sep 09", "Charlotte", "Kansas State"],
        ["Sat, Sep 09", "San Jose State", "Texas"],
        ["Sat, Sep 09", "TCU", "Arkansas"],
        ["Sat, Sep 09", "Central Michigan", "Kansas"],
        ["Sat, Sep 09", "Oklahoma", "Ohio State"],
        ["Sat, Sep 09", "UTSA", "Baylor"],
        ["Sat, Sep 16", "Oklahoma State", "Pittsburgh"],
        ["Sat, Sep 16", "Delaware State", "West Virginia"],
        ["Sat, Sep 16", "Kansas", "Ohio"],
        ["Sat, Sep 16", "Iowa State", "Akron"],
        ["Sat, Sep 16", "Baylor", "Duke"],
        ["Sat, Sep 16", "SMU", "TCU"],
        ["Sat, Sep 16", "Tulane", "Oklahoma"],
        ["Sat, Sep 16", "Kansas State", "Vanderbilt"],
        ["Sat, Sep 16", "Arizona State", "Texas Tech"],
        ["Sat, Sep 16", "Texas", "Southern California"],
        ["Sat, Sep 23", "West Virginia", "Kansas"],
        ["Sat, Sep 23", "Texas Tech", "Houston"],
        ["Sat, Sep 23", "TCU", "Oklahoma State"],
        ["Sat, Sep 23", "Oklahoma", "Baylor"],
        ["Thu, Sep 28", "Texas", "Iowa State"],
        ["Sat, Sep 30", "Baylor", "Kansas State"],
        ["Sat, Sep 30", "Oklahoma State", "Texas Tech"],
        ["Sat, Oct 07", "Texas Tech", "Kansas"],
        ["Sat, Oct 07", "Iowa State", "Oklahoma"],
        ["Sat, Oct 07", "West Virginia", "TCU"],
        ["Sat, Oct 07", "Kansas State", "Texas"],
        ["Sat, Oct 14", "TCU", "Kansas State"],
        ["Sat, Oct 14", "Texas Tech", "West Virginia"],
        ["Sat, Oct 14", "Kansas", "Iowa State"],
        ["Sat, Oct 14", "Oklahoma", "Texas"],
        ["Sat, Oct 14", "Baylor", "Oklahoma State"],
        ["Sat, Oct 21", "Oklahoma State", "Texas"],
        ["Sat, Oct 21", "Iowa State", "Texas Tech"],
        ["Sat, Oct 21", "Oklahoma", "Kansas State"],
        ["Sat, Oct 21", "Kansas", "TCU"],
        ["Sat, Oct 21", "West Virginia", "Baylor"],
        ["Sat, Oct 28", "Texas", "Baylor"],
        ["Sat, Oct 28", "Oklahoma State", "West Virginia"],
        ["Sat, Oct 28", "Kansas State", "Kansas"],
        ["Sat, Oct 28", "TCU", "Iowa State"],
        ["Sat, Oct 28", "Texas Tech", "Oklahoma"],
        ["Sat, Nov 04", "Iowa State", "West Virginia"],
        ["Sat, Nov 04", "Kansas State", "Texas Tech"],
        ["Sat, Nov 04", "Texas", "TCU"],
        ["Sat, Nov 04", "Baylor", "Kansas"],
        ["Sat, Nov 04", "Oklahoma", "Oklahoma State"],
        ["Sat, Nov 11", "TCU", "Oklahoma"],
        ["Sat, Nov 11", "Texas Tech", "Baylor"],
        ["Sat, Nov 11", "West Virginia", "Kansas State"],
        ["Sat, Nov 11", "Oklahoma State", "Iowa State"],
        ["Sat, Nov 11", "Kansas", "Texas"],
        ["Sat, Nov 18", "Kansas State", "Oklahoma State"],
        ["Sat, Nov 18", "Iowa State", "Baylor"],
        ["Sat, Nov 18", "Oklahoma", "Kansas"],
        ["Sat, Nov 18", "Texas", "West Virginia"],
        ["Sat, Nov 18", "TCU", "Texas Tech"],
        ["Fri, Nov 24", "Baylor", "TCU"],
        ["Fri, Nov 24", "Texas Tech", "Texas"],
        ["Sat, Nov 25", "Iowa State", "Kansas State"],
        ["Sat, Nov 25", "Kansas", "Oklahoma State"],
        ["Sat, Nov 25", "West Virginia", "Oklahoma"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildTeamSchedule()
        teamScheduleTable.delegate = self
        teamScheduleTable.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TeamScheduleCell
        cell.date.text = teamSchedule[indexPath.row][0]
        cell.home.text = teamSchedule[indexPath.row][1]
        cell.away.text = teamSchedule[indexPath.row][2]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamSchedule.count
    }
    
    
    @IBAction func goBack(_ sender: Any) {
        performSegue(withIdentifier: "viewDetail", sender: self)
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "viewDetail" {
            let teamDetailController = segue.destination as! TeamDetailController
            teamDetailController.selectedTeam = self.selectedTeam
        }
    }


    func buildTeamSchedule() {
        teamSchedule = [["Date", "Home", "Away"]]
        for schedule in completeSchedule {
            if schedule[1] == selectedTeam || schedule[2] == selectedTeam {
                teamSchedule.append(schedule)
            }
        }
    }

}
