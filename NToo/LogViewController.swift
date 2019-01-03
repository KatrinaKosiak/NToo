//
//  LogViewController.swift
//  NToo
//
//  Created by admin on 10/12/2018.
//  Copyright © 2018 Kat. All rights reserved.
//

import UIKit

class LogViewController: UIViewController {
    
    //helpers
    var highlighted:UIButton?
    var selectedLabel:String?      // the label sent from prevoius controller via segue
    var initialHighlighted: UIButton?       //used to set the first selected menu item
    
    //top menu buttons
    @IBOutlet var carbsBtn: UIButton!
    @IBOutlet var insulinBtn: UIButton!
    @IBOutlet var levelsBtn: UIButton!
    @IBOutlet var exerciseBtn: UIButton!
    @IBOutlet var illnessBtn: UIButton!
    @IBOutlet var alcoholBtn: UIButton!
    
    //content views
    @IBOutlet var CarbsView: UIView!
    @IBOutlet var InsulinView: UIView!
    @IBOutlet var LevelsView: UIView!
    @IBOutlet var ExerciseView: UIView!
    @IBOutlet var IllnessView: UIView!
    @IBOutlet var AlcoholView: UIView!
    
    
    //text fields
    @IBOutlet var carbohydratesTextField: UITextField!
    @IBOutlet var insulinTextField: UITextField!
    @IBOutlet var levelsTextField: UITextField!
    @IBOutlet var exerciseTimeTextField: UITextField!
    @IBOutlet var medicationTakenTextField: UITextField!
    @IBOutlet var illnessUnitsTextField: UITextField!
    @IBOutlet var alcoholVolumeTextField: UITextField!
    @IBOutlet var abvTextField: UITextField!
    
    //dropdowns
    @IBOutlet var insulinType: UIButton!
    @IBOutlet var exerciseType: UIButton!
    @IBOutlet var exerciseIntensity: UIButton!
    @IBOutlet var illnessType: UIButton!
    
    
    //picker Views
    @IBOutlet var insulinPickerView: UIPickerView!
    @IBOutlet var exerciseTypePickerView: UIPickerView!
    @IBOutlet var exerciseIntensityPickerView: UIPickerView!
    @IBOutlet var illnessTypePickerView: UIPickerView!
    
    @IBOutlet var submitBtn: UIButton!
    @IBOutlet var previousBtn: UIButton!
    @IBOutlet var nextBtn: UIButton!
    
    
    private let types = ["Rapid-acting", "Short-acting","Mixed","Intermediate-acting","Long-acting"]
    
    private let exerciseTypes = ["Cardiovascular", "Strength Training","Stretching"]
    
    private let exerciseIntensities = ["Low", "Moderate","Vigorous"]
    
    private let illnessTypes = ["Cold/Flu", "Stomach Aches","Headache/Migraine"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        main()
    }
    
    func main(){
        setSender()
        carbs(highlighted!)
        setupViews()
        sourcePickers()
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
        setContent()
        
    }
    
    func setupViews(){
        carbohydratesTextField.placeholder = "Carbohydrates (g)"
        insulinTextField.placeholder = "Units"
        levelsTextField.placeholder = "mmol/L"
        exerciseTimeTextField.placeholder = "Time"
        medicationTakenTextField.placeholder = "Medication Taken"
        illnessUnitsTextField.placeholder = "Units"
        abvTextField.placeholder = "ABV (Alcohol Volume %)"
        alcoholVolumeTextField.placeholder = "Drink Volume (ml)"
        
        exerciseType.setTitle("Exercise Type", for: .normal)
        exerciseIntensity.setTitle("Exercise Intensity", for: .normal)
        illnessType.setTitle("Illness Type", for: .normal)
        insulinType.setTitle("Insulin Type", for: .normal)
    }
    
    func sourcePickers(){
        insulinPickerView.dataSource = self
        insulinPickerView.delegate = self
        
        exerciseTypePickerView.dataSource = self
        exerciseTypePickerView.delegate = self
        
        exerciseIntensityPickerView.dataSource = self
        exerciseIntensityPickerView.delegate = self
        
        illnessTypePickerView.dataSource = self
        illnessTypePickerView.delegate = self
        
    }
    
    
    //setupTitleLabel sets the format and the label text to "sender"
    func setupTitleLabel(sender: String){
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
        titleLabel.text = sender
    }

    func setLabel(){ //sets the label title
        setupTitleLabel(sender: highlighted?.currentTitle! ?? "Title")
    }
    
    
    
    
    func setContent(){  //hides all the views and displays only the highlighted one
        CarbsView.isHidden = true
        InsulinView.isHidden = true
        LevelsView.isHidden = true
        ExerciseView.isHidden = true
        IllnessView.isHidden = true
        AlcoholView.isHidden = true
        insulinPickerView.isHidden = true
        exerciseTypePickerView.isHidden = true
        exerciseIntensityPickerView.isHidden = true
        illnessTypePickerView.isHidden = true
        previousBtn.isHidden = true
        nextBtn.isHidden = true
        
        switch highlighted?.currentTitle!{
        case "Carbs":
            CarbsView.isHidden = false
            nextBtn.isHidden = false
            break
        case "Insulin":
            InsulinView.isHidden = false
            previousBtn.isHidden = false
            nextBtn.isHidden = false
            break
        case "Levels":
            LevelsView.isHidden = false
            previousBtn.isHidden = false
            nextBtn.isHidden = false
            break
        case "Exercise":
            ExerciseView.isHidden = false
            previousBtn.isHidden = false
            nextBtn.isHidden = false
            break
        case "Illness":
            IllnessView.isHidden = false
            previousBtn.isHidden = false
            nextBtn.isHidden = false
            break
        case "Alcohol":
            AlcoholView.isHidden = false
            previousBtn.isHidden = false
            break
        case .none:
            break
        case .some(_):
            break
        }
    }
    

    
    
    
    //opening pickerViews
    @IBAction func selectInsulinType(_ sender: UIButton) {
        insulinPickerView.isHidden = false
    }
    
    
    @IBAction func selectExerciseType(_ sender: Any) {
        exerciseTypePickerView.isHidden = false
        exerciseIntensityPickerView.isHidden = true
    }
    
    @IBAction func selectExerciseIntensity(_ sender: Any) {
        exerciseIntensityPickerView.isHidden = false
        exerciseTypePickerView.isHidden = true
    }
    
    @IBAction func selectIllnessType(_ sender: Any) {
        illnessTypePickerView.isHidden = false
    }
    
    //previous - next - submit buttons
    
    @IBAction func selectPrevious(_ sender: Any) {
        
        switch highlighted?.currentTitle {
        case "Insulin":
            carbs(carbsBtn)
            break
        case "Levels":
            carbs(insulinBtn)
            break
        case "Exercise":
            carbs(levelsBtn)
            break
        case "Illness":
            carbs(exerciseBtn)
            break
        case "Alcohol":
            carbs(illnessBtn)
            break
        default:
            break
        }
    }
    @IBAction func selectNext(_ sender: Any) {
        switch highlighted?.currentTitle {
        case "Carbs":
            carbs(insulinBtn)
            break
        case "Insulin":
            carbs(levelsBtn)
            break
        case "Levels":
            carbs(exerciseBtn)
            break
        case "Exercise":
            carbs(illnessBtn)
            break
        case "Illness":
            carbs(alcoholBtn)
            break
        default:
            break
        }
    }
    
}





extension LogViewController:UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1    //how many components can be selected
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        switch pickerView {
        case insulinPickerView:
            return types.count
        case exerciseTypePickerView:
            return exerciseTypes.count
        case exerciseIntensityPickerView:
            return exerciseIntensities.count
        case illnessTypePickerView:
            return illnessTypes.count
        default:
            return 1
        }

    
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        insulinPickerView.isHidden = true
        exerciseTypePickerView.isHidden = true
        exerciseIntensityPickerView.isHidden = true
        illnessTypePickerView.isHidden = true
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch pickerView {
        case insulinPickerView:
           insulinType.setTitle(types[row], for: .normal)
            break
        case exerciseTypePickerView:
            exerciseType.setTitle(exerciseTypes[row], for: .normal)
            break
        case exerciseIntensityPickerView:
            exerciseIntensity.setTitle(exerciseIntensities[row], for: .normal)
            break
        case illnessTypePickerView:
            illnessType.setTitle(illnessTypes[row], for: .normal)
            break
        default:
            break
        }

    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        switch pickerView {
        case insulinPickerView:
            return types[row]
        case exerciseTypePickerView:
            return exerciseTypes[row]
        case exerciseIntensityPickerView:
            return exerciseIntensities[row]
        case illnessTypePickerView:
            return illnessTypes[row]
        default:
            return types[row]
        }
    }
    

}
