//
//  ViewController.swift
//  hackathon_motion
//
//  Created by Nathan on 3/8/18.
//  Copyright © 2018 Nathan. All rights reserved.
//

//
//  ViewController.swift
//  CoreMotionDemo
//
//  Created by Eli Byers on 7/7/17.
//  Copyright © 2017 Eli Byers. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    @IBOutlet weak var SpinmeLabel: UILabel!
    
    
    @IBAction func stopButton(_ sender: UIButton) {
    }
    var motionManager = CMMotionManager()
    let opQueue = OperationQueue()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if motionManager.isDeviceMotionAvailable {
            print("We can detect device motion")
            startReadingMotionData()
        }
        else {
            print("We cannot detect device motion")
        }
//        self.view.backgroundColor = UIColor(patternImage: (UIImage(named: "pic.jpg"))!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func startReadingMotionData() {
        // set read speed
        motionManager.deviceMotionUpdateInterval = 1
        // start reading
        motionManager.startDeviceMotionUpdates(to: opQueue) {
            (data: CMDeviceMotion?, error: Error?) in
            
            if let mydata = data {
                print("mydata", mydata.gravity)
                //                print("pitch raw", mydata.attitude.pitch)
                //                print("pitch", self.degrees(mydata.attitude.pitch))
            }
        }
    }
    
    
    func degrees(_ radians: Double) -> Double {
        return 180/Double.pi * radians
    }
 
    let north = [
        ["name": "Seattle", "country": "United States", "population": "3,439,809", "food_dishes":"Seattle Dog, Ginger Beer", "climate": "Warm-summer Mediterranean climate", "languages": "English"],
        ["name": "Vancouver", "country": "Canada", "population": "603,000", "food_dishes":"JapaDog, Salmon Candy", "climate": "Oceanic climate", "languages": "French, English"],
        ["name": "Quebec City", "country": "Canada", "population": "538,238", "food_dishes":"Poutine, Tarte au sucre", "climate": "Humid continental climate", "languages": "French, English"],
        ["name": "San Francisco", "country": "United States", "population": "870,887", "food_dishes":"Mission-Style Burrito, Joe’s Special", "climate": "Warm-summer Mediterranean climate", "languages": "English"],
        ["name": "Anchorage", "country": "United States", "population": "291,826", "food_dishes":"Grilled Salmon, Reindeer Dogs", "climate": "Subarctic climate ", "languages": "English"]
    ]
    

    func updateUI(){
        SpinmeLabel.text = north[0]["name"]
    }
}

