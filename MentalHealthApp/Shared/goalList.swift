import SwiftUI

struct CheckListItem : Identifiable{
    var id: Int
    var isChecked: Bool = false
    var title: String
    
 }

struct goalCell: View {
    @State var isChecked: Bool = false
    var name: String
    func toggle() { isChecked = !isChecked }
    var body: some View {
        VStack{
            HStack{
                Button(action: toggle) {
                    Image(systemName: isChecked ? "checkmark.circle" : "circle")
                }
                Text(name)
            }
        }
    }
}

struct goalList: View {
    @StateObject private var stores : GoalStore = GoalStore(goals: goalData)
    var body: some View {
        VStack{
            
            Text("My Goals").font(.title).fontWeight(.bold)
            Spacer()
            List {
                ForEach (stores.goals) {
                    item in goalCell(isChecked: item.isChecked, name: item.name)
                }
            }
        }
        
    }
}
struct goalList_Previews: PreviewProvider {
    static var previews: some View {
        goalList()
    
    }
}
