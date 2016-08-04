//
//  ViewController.swift
//  AdhanApp
//
//  Created by tixboubou on 7/26/16.
//  Copyright © 2016 tixboubou. All rights reserved.
//

import UIKit
import Adhan

class ViewController: UIViewController {
    
    
    @IBOutlet weak var fajerTime: UILabel!
    @IBOutlet weak var doherTime: UILabel!
    @IBOutlet weak var asserTime: UILabel!
    @IBOutlet weak var maghribTime: UILabel!
    @IBOutlet weak var aichaaTime: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let cal = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        let date = cal.components([.Year, .Month, .Day], fromDate:NSDate())
        let coordinates = Coordinates(latitude: 35.78056, longitude: -78.6389)
        var params = CalculationMethod.MoonsightingCommittee.params
        params.madhab = .Hanafi
        if let prayers = PrayerTimes(coordinates: coordinates, date: date, calculationParameters: params) {
            let formatter = NSDateFormatter()
            formatter.timeStyle = .MediumStyle
            formatter.timeZone = NSTimeZone(name: "America/New_York")!
            
            fajerTime.text = formatter.stringFromDate(prayers.fajr)
            doherTime.text = formatter.stringFromDate(prayers.dhuhr)
            asserTime.text = formatter.stringFromDate(prayers.asr)
            maghribTime.text = formatter.stringFromDate(prayers.maghrib)
            aichaaTime.text = formatter.stringFromDate(prayers.isha)
            
            NSLog("fajr %@", formatter.stringFromDate(prayers.fajr))
            NSLog("sunrise %@", formatter.stringFromDate(prayers.sunrise))
            NSLog("dhuhr %@", formatter.stringFromDate(prayers.dhuhr))
            NSLog("asr %@", formatter.stringFromDate(prayers.asr))
            NSLog("maghrib %@", formatter.stringFromDate(prayers.maghrib))
            NSLog("isha %@", formatter.stringFromDate(prayers.isha))
        }
        
        
   
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

