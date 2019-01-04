//
//  Insulin.swift
//  NToo
//
//  Created by admin on 03/01/2019.
//  Copyright © 2019 Kat. All rights reserved.
//

import UIKit

class Insulin{
    //Properties
    private var type: String?
    private var units: Int?
    
    
    
    //Init
    init(type: String?, units: Int?){
        if !(type == "Insulin Type"){
            self.type = type
        }
        else {
            self.type = ""
        }
        self.units = units
    }
    
    init(){
        self.type = ""
        self.units = 0
    }

    //Methods
    

    func setInsulin(insulin: Insulin){
        self.setType(type: insulin.type!)
        self.setUnits(units: insulin.units!)
    }
    

    func setType(type:String){
        if !(type == "Insulin Type"){
            self.type = type
        }
        else{
            self.type = ""
        }
    }
    
    func setUnits(units:Int){
        self.units = units
    }
    
    
    func toString() -> String{
        return "Insulin type = \(type ?? "nil"), Insulin Units = \(units ?? 0)"
    }
}
