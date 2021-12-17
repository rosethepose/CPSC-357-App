
/*
 When a goal is clicked this shows the information of the goal
 *shows the name, time, and description of current goal
 */

import SwiftUI
 struct GoalDetail: View {
    var selectedGoal: Goal
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Goal Details")) {
                    Text(selectedGoal.name)
                        .font(.headline)
                    Text(selectedGoal.time)
                        .font(.caption)
                    Text(selectedGoal.description)
                        .font(.body)
                        
                    }
                }
            
        }
        
    }
}
struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        GoalDetail(selectedGoal: goalData[1])
    }
}
