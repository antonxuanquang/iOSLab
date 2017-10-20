//
//  ViewController.swift
//  iOSLab4
//
//  Created by Nguyen, Quang on 10/19/17.
//  Copyright © 2017 Nguyen, Quang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var pickerTeam: UIPickerView!
    var teamNames: [String]!
    var selectedTeam: String!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pickerTeam.delegate = self
        pickerTeam.dataSource = self
        
        teamNames = ["Baylor", "Iowa State", "Kansas", "Kansas State", "Oklahoma", "Oklahoma State", "TCU", "Texas", "Texas Tech", "West Virginia"]
    }
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return teamNames.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return teamNames[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedTeam = teamNames[row]
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

