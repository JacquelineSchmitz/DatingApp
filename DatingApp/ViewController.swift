//
//  ViewController.swift
//  DatingApp
//
//  Created by Jacqueline Schmitz on 14.11.22.
//

import UIKit

class ViewController: UIViewController {
  
    
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var birthdayField: UITextField!
    
    @IBOutlet weak var heightField: UITextField!
    
    @IBOutlet weak var hairField: UITextField!
  
    @IBOutlet weak var eyeField: UITextField!
    
    @IBOutlet weak var genderField: UITextField!
    
    @IBOutlet weak var showmeField: UITextField!
    
    
    let hairList = ["Blond","Black","Red","Brown"]
    let hairPicker = UIPickerView()
    
    let eyeList = ["Green","Grey","Blue","Brown"]
    let eyePicker = UIPickerView()
    
    let genderList = ["Männlich","Weiblich","Divers"]
    let genderPicker = UIPickerView()
    
    let showmeList = ["Alle","Männlich","Weiblich","Divers"]
    let showmePicker = UIPickerView()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.keyboardType = .emailAddress
        birthdayField.keyboardType = .decimalPad
        heightField.keyboardType = .decimalPad
    
        
        hairPicker.dataSource = self
        hairPicker.delegate = self
        hairField.inputView = hairPicker
        
        eyePicker.dataSource = self
        eyePicker.delegate = self
        eyeField.inputView = eyePicker
        
        genderPicker.dataSource = self
        genderPicker.delegate = self
        genderField.inputView = genderPicker
        
        showmePicker.dataSource = self
        showmePicker.delegate = self
        showmeField.inputView = showmePicker
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }

}

extension ViewController:UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView{
        case hairPicker: return hairList.count
        case eyePicker: return eyeList.count
        case eyePicker: return eyeList.count
        case eyePicker: return eyeList.count
        case genderPicker: return genderList.count
        case showmePicker: return showmeList.count
        default:
            return 0
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView{
        case hairPicker: return  hairList[row]
        case eyePicker: return  eyeList[row]
        case genderPicker: return  genderList[row]
        case showmePicker: return  showmeList[row]
        default:
            return ""
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView{
        case hairPicker: return hairField.text = hairList[row]
        case eyePicker: return eyeField.text = eyeList[row]
        case genderPicker: return genderField.text = genderList[row]
        case showmePicker: return showmeField.text = showmeList[row]
            
        default:
            print ("Hallo")
        }
        self.view.endEditing(true)
    }
}

