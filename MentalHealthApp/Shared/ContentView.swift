import SwiftUI
let checkListData = [
    CheckListItem(id:0,title: "Goal 1"),
    CheckListItem(id:1,title:"Goal 2"),
    CheckListItem(id:2,title:"Goal 3")
]

struct CheckListItem : Identifiable{
    var id: Int
    var isChecked: Bool = false
    var title: String
    
 }

struct CheckView: View {
    @State var isChecked:Bool = false
    var title:String
    func toggle(){isChecked = !isChecked}
    var body: some View {
        HStack{
            Button(action: toggle) {
                Image(systemName: isChecked ? "checkmark.circle" : "circle")
            }
            Text(title)
        }
    }
}
struct ContentView: View {
    var body: some View {
        
        VStack{
            Text("Mental Health Dashboard").font(.title).fontWeight(.bold)
            Spacer()
            VStack{ //list of goals
                Text("My goals")
                List(checkListData){ item in CheckView(isChecked: item.isChecked, title: item.title)
                        }
                //on click send to goal page
            }
            Spacer()
            VStack {
                Text("My week")
                HStack{
                    //week view
                }
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
