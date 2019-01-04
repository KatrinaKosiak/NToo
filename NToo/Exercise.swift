//
//  Exercise.swift
//  NToo
//
//  Created by admin on 03/01/2019.
//  Copyright © 2019 Kat. All rights reserved.
//

import UIKit

class Exercise{
    //Properties
    private var type: String?
    private var intensity: String?
    private var time: Int?

    //Init
    init(type: String?, intensity: String?, time: Int?){
        if !(type == "Exercise Type"){
            self.type = type
        }
        else{
            self.type = ""
        }
        if !(intensity == "Exercise Intensity"){
            self.intensity = intensity
        }
        else{
            self.intensity = ""
        }
        self.time = time
    }
    
    
    init(){
        self.type = ""
        self.intensity = ""
        self.time = 0
    }
    
    
    
    //Methods
    
    func setExercise(exercise: Exercise){
        self.setType(type: exercise.type!)
        self.setIntensity(intensity: exercise.intensity!)
        self.setTime(time: exercise.time!)
    }
    
    
    func setType(type:String){
        if !(type == "Exercise Type"){
            self.type = type
        }
        else{
            self.type = ""
        }
    }
    func setIntensity(intensity:String){
        if !(intensity == "Exercise Intensity"){
            self.intensity = intensity
        }
        else{
            self.intensity = ""
        }
    }
    
    func setTime(time:Int){
        self.time = time
    }
    
    
    
    func toString() -> String {
        return "Exercise Type = \(type!), Exercise Intensity = \(intensity!), Exercise Time = \(time!)"
    }
    
}
