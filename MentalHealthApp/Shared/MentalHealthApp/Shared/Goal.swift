//
//  Goal.swift
//  MentalHealthApp
//
//  Created by cpsc on 12/9/21.
//

import Foundation
import SwiftUI

struct Goal : Codable, Identifiable {
    let id : String
    var name : String
    var time : String
    var description : String
    var isChecked : Bool
    
    mutating func goalAccomplished()
    {
        isChecked = true
    }

}
