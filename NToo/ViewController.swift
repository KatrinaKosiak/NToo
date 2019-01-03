//
//  ViewController.swift
//  NToo
//
//  Created by admin on 10/12/2018.
//  Copyright © 2018 Kat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.isTranslucent = false
        setupTitleLabel(sender: "Log") //TODO not working
    }
    //prepare completes these steps before using segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let receivedButton = sender as! UIButton
        let receiverVC = segue.destination as! LogViewController
        receiverVC.selectedLabel =  receivedButton.titleLabel?.text //sends the label text of the button pressed to the LogViewController by setting selectedLabel to that value
        
    }
    
    //setupTitleLabel sets the format and the label text to "sender"
    func setupTitleLabel(sender: String){
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
        
        titleLabel.text = sender
    }
    
    
    @IBAction func logButton(_ sender: Any) {

    }
    
    @IBAction func setHighlighted(_ sender: Any) {
        
    }
}

