//
//  GoalStore.swift
//  MentalHealthApp
//
//  Created by cpsc on 12/9/21.
//
/*
 Stores the Goal structures 
 */
import Foundation
import SwiftUI
import Combine
class GoalStore : ObservableObject {
    @Published var goals: [Goal]
    init (goals: [Goal] = []) {
        self.goals = goals
    }
}
