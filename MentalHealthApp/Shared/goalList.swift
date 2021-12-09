import SwiftUI
let checkListData = [
    CheckListItem(id:0,title: "Goal 1"),
    CheckListItem(id:1,title:"Goal 2"),
    CheckListItem(id:2,title:"Goal 3"),
    CheckListItem(id:3,title:"Goal 4"),
    CheckListItem(id:4,title:"Goal 5")
]

struct CheckListItem : Identifiable{
    var id: Int
    var isChecked: Bool = false
    var title: String
    
 }

struct goalList: View {
    @State var isChecked:Bool = false
    var title:String
    func toggle(){isChecked = !isChecked}
    var body: some View {
        VStack{
            HStack{
                Button(action: toggle) {
                    Image(systemName: isChecked ? "checkmark.circle" : "circle")
                }
                Text(title)
            }
        }
    }
}



struct goalList_Previews: PreviewProvider {
    static var previews: some View {
        //goalList()
        VStack{
            Text("My Goals").font(.title).fontWeight(.bold)
            Spacer()
            List(checkListData){ item in goalList(isChecked: item.isChecked, title: item.title)
                    }
        }
        
    }
}



