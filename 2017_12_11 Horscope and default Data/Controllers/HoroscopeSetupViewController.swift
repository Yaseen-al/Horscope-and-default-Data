//
//  HoroscopeSetupViewController.swift
//  2017_12_11 Horscope and default Data
//
//  Created by C4Q on 12/11/17.
//  Copyright © 2017 Quark. All rights reserved.
//

import UIKit

class HoroscopeSetupViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var dateAndSignPicker: UIPickerView!
    let myHoroscopeNames = ["Aries", "Leo", "Sagittarius", "Taurus", "Virgo", "Capricorn", "Gemini", "Libra", "Aquarius", "Cancer", "Scorpio", "Pisces"]
    let myDates = ["today", "yesterday","tomorrow"]
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return myHoroscopeNames.count
        default:
            return myDates.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return myHoroscopeNames[row]
        default:
            return myDates[row]
        }
    }

    @IBAction func updateButton(_ sender: UIButton) {
        let horoscopeName = myHoroscopeNames[dateAndSignPicker.selectedRow(inComponent: 0)]
        let searchDate = myDates[dateAndSignPicker.selectedRow(inComponent: 1)]
        print(horoscopeName, searchDate)
        let completion: (Horoscope)->Void = {(onlineHoroscope: Horoscope) in
            let encodedHoroscope = try! PropertyListEncoder().encode(onlineHoroscope)
            defaults.set(encodedHoroscope, forKey: DefaultKeys.defaultHoroscope.rawValue)
            print(onlineHoroscope.mood)
        }
        HoroscopeAPIClient.manager.getHoroscop(from: "https://aztro.herokuapp.com/?sign=\(horoscopeName)&day=\(searchDate)", completionHandler: completion, errorHandler: {print($0)})
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dateAndSignPicker.delegate = self
        self.dateAndSignPicker.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
