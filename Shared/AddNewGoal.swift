//
//  AddNewGoal.swift
//  MentalHealthApp
//
//  Created by cpsc on 12/16/21.
//

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

struct IntInput: View {
    //allows user to enter int input
    
    var title: String
    @Binding var userInt: Int
        
    var body: some View {
            
        VStack(alignment: HorizontalAlignment.leading) {
            Text(title)
                .font(.headline)
            //format in number and only allow number pad to prevent bad input
            TextField("Enter \(title)", value: $userInt, formatter: NumberFormatter())
                .keyboardType(.numberPad)
        }
        .padding()
    }
}

