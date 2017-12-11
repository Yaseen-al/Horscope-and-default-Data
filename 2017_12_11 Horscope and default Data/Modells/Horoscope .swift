//
//  Horoscope .swift
//  2017_12_11 Horscope and default Data
//
//  Created by C4Q on 12/11/17.
//  Copyright © 2017 Quark. All rights reserved.
//

import Foundation
struct Horoscope: Codable {
    let mood: String
    let color: String
    let description: String
    let luckyTime: String
    let compatibility: String
    enum CodingKeys: String, CodingKey {
        case mood
        case color
        case description
        case luckyTime = "lucky_time"
        case compatibility
    }
}
