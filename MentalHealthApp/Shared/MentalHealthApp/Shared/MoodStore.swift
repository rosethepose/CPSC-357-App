//
//  MoodStore.swift
//  MentalHealthApp (iOS)
//
//  Created by Jacob Dunkle on 12/16/21.
//

import Foundation
import SwiftUI
import Combine

/*
 MoodStore creates data structure appending and storing all mood objects.
 */

class MoodStore: ObservableObject {
    @Published var moods: [Mood]

    init(moods: [Mood] = []){
        self.moods = moods
    }
}
