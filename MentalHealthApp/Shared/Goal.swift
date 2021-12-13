//
//  Goal.swift
//  MentalHealthApp
//
//  Created by cpsc on 12/9/21.
//

import Foundation
struct Goal : Codable, Identifiable, MutableDataProtocol {
    let id : Int
    var name : String
    var time : String
    var description : String
    var isChecked : Bool
}

func goalAccomplished()
{
    print("Congratulations!")
}
