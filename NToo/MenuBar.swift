//
//  MenuBar.swift
//  NToo
//
//  Created by admin on 10/12/2018.
//  Copyright © 2018 Kat. All rights reserved.
//

import UIKit

class MenuBar:UIView{
    
    @IBAction func touchCarbs(_ sender: UIButton) {
        sender.tintColor = UIColor(red: 230/255, green: 32/255, blue: 31/255, alpha: 1)
    }
    override init(frame: CGRect){
        super.init(frame:frame)
        backgroundColor = UIColor.blue
    }
    
    required init?(coder aDecoder:NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
}
