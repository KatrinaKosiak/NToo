//
//  Record.swift
//  NToo
//
//  Created by admin on 03/01/2019.
//  Copyright © 2019 Kat. All rights reserved.
//

import UIKit

class Record{
    //Properties
    private var keyTime: Date?
    private var carbohydrates: Int?
    private var insulin: Insulin?
    private var levels: Float?
    private var exercise: Exercise?
    private var illness: Illness?
    private var alcohol: Alcohol?
    
    //Init
    init(carbohydrates: Int?, insulin: Insulin?, levels: Float?, exercise: Exercise?, illness: Illness?, alcohol: Alcohol?){
        keyTime = Date()
        self.carbohydrates = carbohydrates
        self.insulin = insulin
        self.levels = levels
        self.exercise = exercise
        self.illness = illness
        self.alcohol = alcohol
        
    }
    
    init(){
        keyTime = Date()
        self.carbohydrates = 0
        self.insulin = Insulin()
        self.levels = 0
        self.exercise = Exercise()
        self.illness = Illness()
        self.alcohol = Alcohol()
      
    }
    //Methods
    func toString() -> String{
       // if !(self == nil){
        return "Time = \(keyTime ?? Date()), Carbohydrates (g) = \(carbohydrates ?? 0), \(insulin?.toString() ?? "Insulin Info = nil"), Levels (mmol/L) = \(levels ?? 0), \(exercise?.toString() ?? "Exercise Info = nil"), \(illness?.toString() ?? "Illness Info = nil"), \(alcohol?.toString() ?? "Alcohol Info = nil" ) \u{1F496}"
        //}
        //return ""
    }
    
    func empty() {
        keyTime = Date()
        self.carbohydrates = 0
        self.insulin = Insulin()
        self.levels = 0
        self.exercise = Exercise()
        self.illness = Illness()
        self.alcohol = Alcohol()
    }
    
    func setRecord(record: Record){
        keyTime = Date()
        self.setCarbohydrates(carbohydrates: record.carbohydrates!)
        self.setInsulin(insulin: record.insulin!)
        self.setLevels(levels: record.levels!)
        self.setExercise(exercise: record.exercise!)
        self.setIllness(illness: record.illness!)
        self.setAlcohol(alcohol: record.alcohol!)
    }
    
    func setKeyTime(){
        keyTime = Date()
    }
    
    func setCarbohydrates(carbohydrates: Int){
        self.carbohydrates = carbohydrates
    }
    
    func setInsulin(insulin: Insulin){
        self.insulin?.setInsulin(insulin: insulin)
        
    }
    
    func setLevels(levels: Float){
        self.levels = levels
    }
    
    func setExercise(exercise: Exercise){
        self.exercise?.setExercise(exercise:exercise)
    }
    
    func setIllness(illness: Illness){
        self.illness?.setIllness(illness:illness)
    }
    
    func setAlcohol(alcohol: Alcohol){
        self.alcohol?.setAlcohol(alcohol:alcohol)
    }
    
}
