//
//  TeamDetailController.swift
//  iOSLab4
//
//  Created by Nguyen, Quang on 10/19/17.
//  Copyright © 2017 Nguyen, Quang. All rights reserved.
//

import UIKit

class TeamDetailController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var schoolName: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var mascot: UILabel!
    @IBOutlet weak var coachName: UILabel!
    var selectedTeam: String!
    
    var schoolDetailComplete: [String: [String]] = [
        "Baylor": ["Balor University", "1301 S University Parks Dr, Waco, TX 76706", "Bear", "Matt Rhule"],
        "Iowa State": ["Iowa State University", "Ames, IA 50011", "Cy the Cardinal", "Matt Campbell"],
        "Kansas": ["University of Kansas", "1450 Jayhawk Blvd, Lawrence, KS 66045", "Big Jay", "David Beaty"],
        "Kansas State": ["Kansas State University", "Manhattan, KS 66506", "Willie the Wildcat", "Bill Snyder"],
        "Oklahoma": ["University of Oklahoma", "660 Parrington Oval, Norman, OK 73019", "Boomer and Sooner", "Lincoln Riley"],
        "Oklahoma State": ["Oklahoma State University", "Stillwater, OK 74074", "Pistol Pete", "Mike Gundy"],
        "TCU": ["Texas Christian University", "2800 S University Dr, Fort Worth, TX 76129", "Horned Frog", "Gary Patterson"],
        "Texas": ["Name", "Location", "Mascot", "Coach"],
        "Texas Tech": ["Name", "Location", "Mascot", "Coach"],
        "West Virginia": ["Name", "Location", "Mascot", "Coach"]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let schoolDetail = schoolDetailComplete[selectedTeam]!
        image.image = UIImage(named: selectedTeam + ".png")
        schoolName.text = schoolDetail[0]
        location.text = schoolDetail[1]
        mascot.text = schoolDetail[2]
        coachName.text = schoolDetail[3]
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let teamScheduleController = segue.destination as! TeamScheduleController
        teamScheduleController.selectedTeam = self.selectedTeam
    }
    

}
