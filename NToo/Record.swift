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
    
    //Methods
    
    
    
}
