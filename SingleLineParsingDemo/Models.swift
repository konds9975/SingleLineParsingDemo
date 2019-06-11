//
//  Models.swift
//  SingleLineParsingDemo
//
//  Created by Kondya on 11/06/19.
//  Copyright © 2019 Kondya. All rights reserved.
//

import Foundation
//struct Models: Codable {
//
//
//    let afghanistan, australia, bangladesh, england: [Afghanistan]
//    let india, newZealand, pakistan, southAfrica: [Afghanistan]
//    let sriLanka, westIndies: [Afghanistan]
//
//    enum CodingKeys: String, CodingKey {
//        case afghanistan = "Afghanistan"
//        case australia = "Australia"
//        case bangladesh = "Bangladesh"
//        case england = "England"
//        case india = "India"
//        case newZealand = "New Zealand"
//        case pakistan = "Pakistan"
//        case southAfrica = "South Africa"
//        case sriLanka = "Sri Lanka"
//        case westIndies = "West Indies"
//    }
//}

// MARK: - Afghanistan
class Country {
    var name : String = ""
    var playerArray : [Player] = []
    
}
class Player {
    var name: String = ""
    var captain: Bool = false
}
