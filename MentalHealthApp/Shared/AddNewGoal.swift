//
//  AddNewGoal.swift
//  MentalHealthApp
//
//
/* Add new Goal Structure
 * Template for new goal (name,description. time, is completed)
 * toggle button if goal is already completed
 * Add new goal button
 */

import SwiftUI

struct AddNewGoal: View {
    @StateObject var goalStore : GoalStore
    @State private var isChecked = false
    @State private var name: String = ""
    @State private var description: String = ""
    @State private var time: String = ""
    var body: some View {
        Form {
            Section(header: Text("Goal Details")) {
                DataInput(title: "Goal Name", userInput: $name)
                DataInput(title: "Description", userInput: $description)
                DataInput(title: "Goal Due", userInput: $time)
                Toggle(isOn: $isChecked) {
                    Text("Completed").font(.headline)
                }.padding()
            }
            Button(action: addNewGoal) {
                Text("Add Goal")
            }
        }
    }
    // This function creates a new goal to store in json
    func addNewGoal() {
        let newGoal = Goal(id: UUID().uuidString, name: name, time:time, description: description,
                         isChecked: isChecked)
        goalStore.goals.append(newGoal)
    }

}

struct AddNewGoal_Previews: PreviewProvider {
    static var previews: some View {
        AddNewGoal(goalStore: GoalStore(goals:goalData))
    }
}
/*
 * Takes in userinput for required fields
 */
struct DataInput: View {
    var title: String
    @Binding var userInput: String
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading) {
            Text(title)
                .font(.headline)
            TextField("Enter \(title)", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }
}


