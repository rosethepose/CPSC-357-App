//
// ContentView.swift
// MentalHealthApp
//
// Created by Rose Ramirez
// Edited by Jacob Dunkle and Michele Okeyemi


import SwiftUI


struct ContentView: View {
    @StateObject private var stores : GoalStore = GoalStore(goals: goalData)
    @StateObject private var mstores : MoodStore = MoodStore(moods: MoodData)
    var body: some View {
        VStack{
            NavigationView {
                    //display the list
                List {
                    NavigationLink(destination: NavigationList()){
                        Text("View Goals")
                    }
                        
                    NavigationLink(destination: AddNewGoal(goalStore: stores)){
                        Text("Add a Goal")
                    }
                    
                    NavigationLink(destination: MoodList()){
                        Text("Mood Journal")
                    }
                    
                    NavigationLink(destination: AddMood(moodStore: mstores)){
                        Text("Add a Mood Journal Entry")
                    }
                }
                .navigationBarTitle(Text("My Mental Health"))
            }
            
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
