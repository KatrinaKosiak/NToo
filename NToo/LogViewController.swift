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
    
    var record:Record = Record.init()
    
    
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
        setTextFieldDelegates()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //let cancel = sender as! UIButton
        let receiver = segue.destination as! LogViewController
        receiver.highlighted =  highlighted//sends the label text of the button pressed to the LogViewController by setting selectedLabel to that value
        
    }
    func setSender(){           //sets the selected label depending on which button was clicked in the previous screen
        
        let topButtons = [carbsBtn, insulinBtn, levelsBtn, exerciseBtn, illnessBtn, alcoholBtn]
        for btn in topButtons{
            if btn?.currentTitle == selectedLabel{
                highlighted = btn
            }

       }
    }
    
    @IBAction func carbs(_ sender: UIButton) {//sets highlighted value and calls for the content change according to the button used (sender)
        highlighted = sender
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
    
    func setTextFieldDelegates(){
        carbohydratesTextField.delegate = self
        insulinTextField.delegate = self
        levelsTextField.delegate = self
        exerciseTimeTextField.delegate = self
        medicationTakenTextField.delegate = self
        illnessUnitsTextField.delegate = self
        alcoholVolumeTextField.delegate = self
        abvTextField.delegate = self
        
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
        hideViews()
        hidePickers()
        highlightMenuButtons()
        previousBtn.isHidden = true
        nextBtn.isHidden = true
        
        switch highlighted?.currentTitle!{
        case "Carbs":
            CarbsView.isHidden = false
            nextBtn.isHidden = false
            carbsBtn.isHighlighted = false
            break
        case "Insulin":
            InsulinView.isHidden = false
            showPrevNext()
            insulinBtn.isHighlighted = false
            break
        case "Levels":
            LevelsView.isHidden = false
            showPrevNext()
            levelsBtn.isHighlighted = false
            break
        case "Exercise":
            ExerciseView.isHidden = false
            showPrevNext()
            exerciseBtn.isHighlighted = false
            break
        case "Illness":
            IllnessView.isHidden = false
            showPrevNext()
            illnessBtn.isHighlighted = false
            break
        case "Alcohol":
            AlcoholView.isHidden = false
            previousBtn.isHidden = false
            alcoholBtn.isHighlighted = false
            break
        case .none:
            break
        case .some(_):
            break
        }
    }
    
    func hidePickers(){
        insulinPickerView.isHidden = true
        exerciseTypePickerView.isHidden = true
        exerciseIntensityPickerView.isHidden = true
        illnessTypePickerView.isHidden = true
    }
    func hideViews(){
        CarbsView.isHidden = true
        InsulinView.isHidden = true
        LevelsView.isHidden = true
        ExerciseView.isHidden = true
        IllnessView.isHidden = true
        AlcoholView.isHidden = true
    }
    
    func highlightMenuButtons(){
        carbsBtn.isHighlighted = true
        insulinBtn.isHighlighted = true
        levelsBtn.isHighlighted = true
        exerciseBtn.isHighlighted = true
        illnessBtn.isHighlighted = true
        alcoholBtn.isHighlighted = true
    }
    func showPrevNext(){
        previousBtn.isHidden = false
        nextBtn.isHidden = false
    }
    
    //opening pickerViews
    @IBAction func selectPicker(_ sender: UIButton) {
        hidePickers()
        switch sender {
        case insulinType:
            insulinPickerView.isHidden = false
            break
        case exerciseType:
            exerciseTypePickerView.isHidden = false
            break
        case exerciseIntensity:
            exerciseIntensityPickerView.isHidden = false
            break
        case illnessType:
            illnessTypePickerView.isHidden = false
            break
        default:
            break
        }
        
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
    
    

    
    @IBAction func submitRecord(_ sender: UIButton) {
        //adjusting data
        record.empty()
        setRecord(record: record)
        
        //adjusting outputs/views
        hidePickers()
        print("------------------------")
        print("------------------------")
        print(record.toString())
        
    }
    
    func setRecord(record: Record){

        record.setRecord(record: Record(carbohydrates: Int(carbohydratesTextField.text ?? "0") ?? 0,
                                        insulin: Insulin(type: (insulinType.titleLabel?.text),
                                                         units: Int(insulinTextField.text ?? "0") ?? 0),
                                        levels: Float(levelsTextField.text ?? "0") ?? 0,
                                        exercise: Exercise(type:exerciseType.titleLabel?.text,
                                                           intensity: exerciseIntensity.titleLabel?.text,
                                                           time: Int(exerciseTimeTextField.text ?? "0") ?? 0),
                                        illness: Illness(type: illnessType.titleLabel?.text,
                                                         medication: medicationTakenTextField.text ?? "",
                                                         units: Int(illnessUnitsTextField.text ?? "0") ?? 0),
                                        alcohol: Alcohol(abv: Float(abvTextField.text ?? "0") ?? 0,
                                                         volume: Int(alcoholVolumeTextField.text ?? "0") ?? 0)))
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
        hidePickers()
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

extension LogViewController:UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let aSet = NSCharacterSet(charactersIn:"0123456789").inverted
        let bSet = NSCharacterSet(charactersIn:"0123456789.").inverted
        
        var compSepByCharInSet: [String]
        var numberFiltered: String

        switch textField {
        case carbohydratesTextField, insulinTextField, exerciseTimeTextField, illnessUnitsTextField, alcoholVolumeTextField:
           // let aSet = NSCharacterSet(charactersIn:"0123456789").inverted
            compSepByCharInSet = string.components(separatedBy: aSet)
            numberFiltered = compSepByCharInSet.joined(separator: "")
            return string == numberFiltered
            
        case levelsTextField, abvTextField:
            compSepByCharInSet = string.components(separatedBy: bSet)
            numberFiltered = compSepByCharInSet.joined(separator: "")
            return string == numberFiltered
            
        default:
            return true
            
        }

    }
}
