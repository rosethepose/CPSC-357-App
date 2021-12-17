//
//  MoodData.swift
//  MentalHealthApp
//
//  Created by Jacob Dunkle on 12/17/21.
//

import Foundation
import UIKit
import SwiftUI

/*
 Json Script Parser in order to load example data into the MoodList page
 */
var MoodData: [Mood] = loadJsonMood("MoodData.json")

func loadJsonMood<T: Decodable>(_ filename: String) -> T {
    let data: Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("\(filename) not found.")
    }
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Could not load \(filename): \(error)")
    }
    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("Unable to parse \(filename): \(error)")
    }
}


