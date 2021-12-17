import SwiftUI


struct ContentView: View {
    @StateObject private var stores : GoalStore = GoalStore(goals: goalData)
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
