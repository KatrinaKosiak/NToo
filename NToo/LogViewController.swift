//
//  LogViewController.swift
//  NToo
//
//  Created by admin on 10/12/2018.
//  Copyright © 2018 Kat. All rights reserved.
//

import UIKit

class LogViewController: UIViewController {
    var highlighted:UIButton?
    var selectedLabel:String?      // the label sent from prevoius controller via segue
    var initialHighlighted: UIButton?       //used to set the first selected menu item
    
    
    @IBOutlet var carbsBtn: UIButton!
    @IBOutlet var insulinBtn: UIButton!
    @IBOutlet var levelsBtn: UIButton!
    @IBOutlet var exerciseBtn: UIButton!
    @IBOutlet var illnessBtn: UIButton!
    @IBOutlet var alcoholBtn: UIButton!
    
    @IBOutlet var insulinPickerView: UIPickerView!
    @IBOutlet var insulinType: UIButton!
    
    
    
    private let types = ["Rapid-acting", "Short-acting","Mixed","Intermediate-acting","Long-acting"]
    override func viewDidLoad() {
        super.viewDidLoad()
        setSender()
        carbs(highlighted!)
        setupViews()
        insulinPickerView.dataSource = self
        insulinPickerView.delegate = self
       // tabBarItem.image
    }
    func setSender(){           //sets the selected label depending on which button was clicked in the previous screen
        switch selectedLabel {
        case "Carbs":
            //initialHighlighted = carbsBtn
            highlighted = carbsBtn
            break
        case "Insulin":
            //initialHighlighted = insulinBtn
            highlighted = insulinBtn
            break
        case "Levels":
            //initialHighlighted = levelsBtn
            highlighted = levelsBtn
            break
        case "Exercise":
            //initialHighlighted = exerciseBtn
            highlighted = exerciseBtn
            break
        case "Illness":
            //initialHighlighted = illnessBtn
            highlighted = illnessBtn
            break
        case "Alcohol":
            //initialHighlighted = alcoholBtn
            highlighted = alcoholBtn
            break
        default:
            break
        }
    }
    
    @IBAction func carbs(_ sender: UIButton) {//sets highlighted value and changes the button color
        if !(highlighted == nil){
            highlighted?.setTitleColor(UIColor(red: 71/255, green: 130/255, blue: 170/255, alpha: 1), for: .normal)
        }
        highlighted = sender
        sender.setTitleColor(UIColor.white, for: .normal)
        setLabel()
        
    }
    

    
    func setLabel(){
        setupTitleLabel(sender: highlighted?.currentTitle! ?? "Title")
    }
    
    func setupViews(){
        insulinType.setTitle("Insulin Type", for: .normal)
        insulinPickerView.isHidden = true
        
    }
    func setContent(){
        
        switch highlighted?.currentTitle!{
            
        case "Carbs":
            break
        case "Insulin":
            break
        case .none:
            break
        case .some(_):
            break
        }
    }
    
    //setupTitleLabel sets the format and the label text to "sender"
    func setupTitleLabel(sender: String){
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
        titleLabel.text = sender
    }
    
    @IBAction func selectInsulinType(_ sender: UIButton) {
        sender.isHidden = true
        insulinPickerView.isHidden = false
    }
    
    
    

    }

extension LogViewController:UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1    //how many components can be selected
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return types.count  //how many components there are in total
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        insulinType.isHidden = false
        insulinPickerView.isHidden = true
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        insulinType.setTitle(types[row], for: .normal)

    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return types[row]
    }
    
}
