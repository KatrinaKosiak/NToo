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
        self.type = type
        self.units = units

        
    }
    
    
    //Methods
    
    func toString() -> String{
        return "Insulin type = \(type!), Insulin Units = \(units!)"
    }
    
    
}
