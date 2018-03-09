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
    
    var motionManager = CMMotionManager()
    let opQueue = OperationQueue()
    let currentCity = "San Jose"
    let north = [["name" : "Seattle"], ["name" : "Seattle"], ["name" : "Seattle"], ["name": "Seattle"], ["name": "Seattle"]]
    let west = [["name" : "Honolulu"], ["name" : "Honolulu"], ["name" : "Honolulu"], ["name" : "Honolulu"], ["name" : "Honolulu"]]
    let east = [["name" : "Denver"], ["name" : "Denver"], ["name" : "Denver"], ["name" : "Denver"], ["name" : "Denver"]]
    let south = [["name" : "San Diego"], ["name" : "San Diego"], ["name" : "San Diego"], ["name" : "San Diego"], ["name" : "San Diego"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if motionManager.isDeviceMotionActive {
            print("We can detect device motion")
        }
        else {
            print("We cannot detect device motion")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if (motion == .motionShake) {
            print("now we're shakin!")
            var city = newCity(quad: "north")
            print(city)
        }
    }
    
    func newCity (quad: String) -> String {
        if quad == "north" {
            var indx = Int(arc4random_uniform(5))
            while north[indx]["name"] == currentCity {
                indx = Int(arc4random_uniform(5)+1)
            }
            if let n = north[indx]["name"] {
                return n
            }
        } else if quad == "south" {
            var indx = Int(arc4random_uniform(5))
            while north[indx]["name"] == currentCity {
                indx = Int(arc4random_uniform(5)+1)
            }
            if let n = north[indx]["name"] {
                return n
            }
        }  else if quad == "east" {
            var indx = Int(arc4random_uniform(5))
            while east[indx]["name"] == currentCity {
                indx = Int(arc4random_uniform(5)+1)
            }
            if let n = east[indx]["name"] {
                return n
            }
        } else if quad == "west" {
            var indx = Int(arc4random_uniform(5))
            while west[indx]["name"] == currentCity {
                indx = Int(arc4random_uniform(5)+1)
            }
            if let n = west[indx]["name"] {
                return n
            }
        }
        
        return "";
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
    
}

