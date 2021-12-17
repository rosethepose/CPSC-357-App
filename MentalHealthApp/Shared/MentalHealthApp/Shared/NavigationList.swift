//
//  NavigationList.swift
//  MentalHealthApp (iOS)
//
//  Created by cpsc on 12/16/21.
//

import SwiftUI

struct ListCell: View {
    var goal: Goal
    @State var isChecked : Bool = false
    func toggle() { isChecked = !isChecked }
    var body: some View {
        NavigationLink(destination: GoalDetail(selectedGoal: goal)) {
            HStack {
                //show the image
                Button(action: toggle) {
                    Image(systemName: isChecked ? "checkmark.circle" : "circle")
                }.buttonStyle(BorderlessButtonStyle())
                Text(goal.name)
            }
        }
    }
}
struct NavigationList: View {
    @StateObject private var stores : GoalStore = GoalStore(goals: goalData)
    var body: some View {
        VStack{
            NavigationView {
                List {
                    //display the list
                    ForEach (stores.goals) { goal in
                        ListCell(goal: goal, isChecked: goal.isChecked)
                    }
                    .onDelete(perform: deleteItems)
                    .onMove(perform: moveItems)
                }
                .navigationBarTitle(Text("Goals"))
                //create the link to the add item page
                .navigationBarItems(leading: NavigationLink(destination: AddNewGoal(goalStore: self.stores)) {
                    Text("Add")
                        .foregroundColor(.blue)
                }, trailing: EditButton())
            }
            
        }
    }
    //modifiers
    func deleteItems(at offsets: IndexSet) {
    stores.goals.remove(atOffsets: offsets)
    }
    func moveItems(from source: IndexSet, to destination: Int) {
    stores.goals.move(fromOffsets: source, toOffset: destination)
    }
}

struct NavigationList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationList()
    }
}
