//
//  UserDefaults.swift
//  2017_12_11 Horscope and default Data
//
//  Created by C4Q on 12/11/17.
//  Copyright © 2017 Quark. All rights reserved.
//

import Foundation

enum DefaultKeys: String {
    case defaultHoroscope
}
let defaults = UserDefaults.standard
var myHoroscope: Horoscope?


