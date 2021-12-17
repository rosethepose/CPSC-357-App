//
//  Mood.swift
//  MentalHealthApp
//
//  Created by Jacob Dunkle on 12/16/21.
//

import Foundation
import SwiftUI

/*
 Object construction of the information that makes up a "Mood" entry
 */
struct Mood : Codable, Identifiable {
    public var id: String
    public var moodStress : String
    public var moodJoy: String
    public var moodNote : String
    public var moodTime: String
}
