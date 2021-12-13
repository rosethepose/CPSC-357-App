import SwiftUI
struct GoalDetail: View {
    let selectedGoal: Goal
    var body: some View {
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

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        GoalDetail(selectedGoal: goalData[1])
    }
}
