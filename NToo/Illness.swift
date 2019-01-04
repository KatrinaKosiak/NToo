//
//  Illness.swift
//  NToo
//
//  Created by admin on 03/01/2019.
//  Copyright © 2019 Kat. All rights reserved.
//

import UIKit

class Illness{
    //Properties
    private var type: String?
    private var medication: String?
    private var units: Int?
    
    
    
    
    //Init
    init(type: String?, medication: String?, units: Int?){
        self.type = type
        self.medication = medication
        self.units = units
    }
    
    
    init(){
        self.type = ""
        self.medication = ""
        self.units = 0
    }
    
    //Methods
    
    func setIllness(illness: Illness){
        self.setType(type: illness.type!)
        self.setMedication(medication: illness.medication!)
        self.setUnits(units:illness.units!)
    }
    
    
    func setType(type:String){
        if !(type == "Illness Type"){
            self.type = type
        }
        else{
            self.type = ""
        }
    }
    
    func setMedication(medication:String){
            self.medication = medication
    }
    
    func setUnits(units:Int){
        self.units = units
    }
    
    
    func toString() -> String {
        return "Illness Type = \(type ?? ""), Medication = \(medication ?? ""), Units = \(units ?? 0)"
    }
    
}
