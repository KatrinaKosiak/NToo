//
//  Alcohol.swift
//  NToo
//
//  Created by admin on 03/01/2019.
//  Copyright © 2019 Kat. All rights reserved.
//

import UIKit

class Alcohol{
    //Properties
    private var abv: Float?
    private var volume: Int?


    //Init
    init(abv: Float?, volume: Int?){
        self.abv = abv
        self.volume = volume
    }
    
    
    init(){
        self.abv = 0
        self.volume = 0
    }
    
    //Methods
    
    func setAlcohol(alcohol: Alcohol){
        self.setAbv(abv: alcohol.abv!)
        self.setAlcoholVolume(volume: alcohol.volume!)
    }
    
    func setAbv(abv: Float){
        self.abv = abv
    }
    
    func setAlcoholVolume(volume: Int){
        self.volume = volume
    }
    
    func toString() -> String {
        return "ABV (Alcohol Volume %) = \(abv ?? 0), Drink Volume = \(volume ?? 0)"
    }
    
}
