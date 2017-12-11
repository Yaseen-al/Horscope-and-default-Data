//
//  HoroscopeViewController.swift
//  2017_12_11 Horscope and default Data
//
//  Created by C4Q on 12/11/17.
//  Copyright © 2017 Quark. All rights reserved.
//

import UIKit

class HoroscopeViewController: UIViewController {
    @IBOutlet weak var horoscopeDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let myhoroscopeData = defaults.value(forKey: DefaultKeys.defaultHoroscope.rawValue) as? Data{
            if let horoscopeAfterDecoding = try? PropertyListDecoder().decode(Horoscope.self, from: myhoroscopeData){
                self.horoscopeDescription.text = horoscopeAfterDecoding.description
            }
        }
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        if let myhoroscopeData = defaults.value(forKey: DefaultKeys.defaultHoroscope.rawValue) as? Data{
            if let horoscopeAfterDecoding = try? PropertyListDecoder().decode(Horoscope.self, from: myhoroscopeData){
                self.horoscopeDescription.text = horoscopeAfterDecoding.description
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        if let myhoroscopeData = defaults.value(forKey: DefaultKeys.defaultHoroscope.rawValue) as? Data{
            if let horoscopeAfterDecoding = try? PropertyListDecoder().decode(Horoscope.self, from: myhoroscopeData){
                self.horoscopeDescription.text = horoscopeAfterDecoding.description
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
