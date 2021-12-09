import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Spacer()
            Text("Mental Health Dashboard").font(.title).fontWeight(.bold)
            Spacer()
            VStack{ //list of goals
                Text("My goals")
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
            Spacer()
            Spacer()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
