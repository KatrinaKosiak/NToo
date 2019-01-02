//
//  HomeViewController.swift
//  NToo
//
//  Created by admin on 02/01/2019.
//  Copyright © 2019 Kat. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()

}
    func setupNavigationBar() {
        navigationController?.navigationBar.isTranslucent = false
        setupTitleLabel(sender: "Home")
        //    self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    func setupBar(){
        
        
    }
    func setupTitleLabel(sender: String){         //set the label at the top - doesn't work...
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
        
        titleLabel.text = sender
    }
    
}
