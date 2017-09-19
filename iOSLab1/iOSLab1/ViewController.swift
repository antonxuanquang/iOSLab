//
//  ViewController.swift
//  iOSLab1
//
//  Created by Nguyen, Quang on 9/4/17.
//  Copyright © 2017 Nguyen, Quang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var datePickerTop: UIDatePicker!
    @IBOutlet weak var datePickerBottom: UIDatePicker!
    @IBOutlet weak var lblDateTop: UILabel!
    @IBOutlet weak var lblDateBottom: UILabel!
    @IBOutlet weak var lblDateDifference: UILabel!
    
    let formatter = DateFormatter()
    
    func getDifference(_ from: Date, _ to: Date) -> String {
        let dateComponentsFormatter = DateComponentsFormatter()
        dateComponentsFormatter.allowedUnits = [.year,.month,.day]
        dateComponentsFormatter.maximumUnitCount = 3
        dateComponentsFormatter.unitsStyle = .full
        let dateDiff = dateComponentsFormatter.string(from: min(from, to), to: max(from, to))
        return dateDiff!
    }

    @IBAction func datePickerListener(_ sender: UIDatePicker) {
        let dateTop = datePickerTop.date
        let dateBottom = datePickerBottom.date
        
        if sender == datePickerTop {
            lblDateTop.text = formatter.string(from: sender.date)
        } else if sender == datePickerBottom {
            lblDateBottom.text = formatter.string(from: sender.date)
        }
        
        lblDateDifference.text = getDifference(dateTop, dateBottom)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        formatter.dateFormat = "EEEE"
        lblDateTop.text = formatter.string(from: datePickerTop.date)
        lblDateBottom.text = formatter.string(from: datePickerBottom.date)
        lblDateDifference.text = getDifference(datePickerTop.date, datePickerBottom.date)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

