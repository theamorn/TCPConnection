//
//  Greeting.swift
//  PlayLabTest
//
//  Created by Amorn Apichattanakul on 5/17/17.
//  Copyright © 2017 Amorn Apichattanakul. All rights reserved.
//

import Foundation
import ObjectMapper

class Greeting: Mappable {
    var welcomeText: String?
    var context: String?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        welcomeText    <- map["welcome"]
        context         <- map["context"]
    }
}
