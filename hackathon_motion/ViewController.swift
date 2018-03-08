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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if motionManager.isDeviceMotionAvailable {
            print("We can detect device motion")
            startReadingMotionData()
        }
        else {
            print("We cannot detect device motion")
        }
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
    
}

