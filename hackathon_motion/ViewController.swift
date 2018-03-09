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
    
    enum Direction {
        case north
        case south
        case east
        case west
    }
    
    var motionManager = CMMotionManager()
    let opQueue = OperationQueue()
    var magnetometerData: CMMagnetometerData?
    var x: Double = 0
    var y: Double = 0
    var z: Double = 0
    var nums: [Double] = []
    var heading: Double = 0
    var direction: Direction = .north
    
//    motionManager.stopMagnetometerUpdates()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if motionManager.isMagnetometerAvailable {
            print("We can detect device direction")
            startReadingMotionData()
        }
        else {
            print("We cannot detect device direction")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startReadingMotionData() {

        motionManager.magnetometerUpdateInterval = 1
        motionManager.showsDeviceMovementDisplay = true
        

        motionManager.startMagnetometerUpdates(to: opQueue) {
            (data: CMMagnetometerData?, error: Error?) in

            

            if let magnetometerData = data {
                print(magnetometerData)
                self.x = magnetometerData.magneticField.x
                self.y = magnetometerData.magneticField.y
                self.z = magnetometerData.magneticField.z
                print(" x: \(self.x), y: \(self.y), z: \(self.z)")
                self.nums = [self.x, self.y, self.z]
                
                if self.y > 0 {
//                    self.heading = (90.0 - (atan(self.x/self.y))*180/Double.pi)
//                    print(self.heading)
                    self.direction = .north
                }
                else if self.y < 0 {
                    print("greater")
                    self.direction = .south
                }
                else if self.y == 0 && self.x < 0 {
                    self.direction = .east
                    print("didn't make it to ifs")
                }
                else {
                    self.direction = .west
                }
            }
                
            else {
                print("Device motion is nil.")
            }

        }
//        motionManager.stopMagnetometerUpdates()
    }

}
    

    


