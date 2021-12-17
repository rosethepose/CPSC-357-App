//
//  AddMood.swift
//  MentalHealthApp
//
//  Created by Jacob Dunkle on 12/16/21.
//

import SwiftUI
/*
 * stressResponse variable holds user text input on Mood Check page.
 * joyResponse variable holds user text input on Mood Check page.
 * notes variable holds user text input on Mood Check page.
 * time variable contains user time input on Mood Check page.
 */

/*
 The AddMood swift file is a view containing the mutable details of creating a new Mood Object for display on MoodList View. It takes four text entry user input after initial trial and error of wanting to use icons for user input. Looking back I would have liked to have the Remember Mood! Button also return the user to the MoodList Page.
 */
struct AddMood: View {
    @StateObject var moodStore : MoodStore
    @State private var stressResponse: String = ""
    @State private var joyResponse: String = ""
    @State private var notes: String = ""
    @State private var time: String = ""
    @StateObject private var mstores : MoodStore = MoodStore(moods: MoodData)
    @State var selection: Int? = nil
    var body: some View {
        Form {
            /*
             * iconography for implying differences in mood.
             */
            Section(header: Text("Mood Check!")){
                HStack{
                    Spacer()
                    Image(systemName: "cloud.bolt.rain.fill")
                        .padding()
                        .clipShape(Circle())
                        .shadow(radius: 8)
                        .font(.system(size: 45))
                    
                    Spacer()
                    Image(systemName: "cloud.fill")
                        .padding()
                        .clipShape(Circle())
                        .shadow(radius: 8)
                        .font(.system(size: 45))
                        .foregroundColor(.gray)
                    Spacer()
                    Image(systemName: "sun.max.fill")
                        .padding()
                        .clipShape(Circle())
                        .shadow(radius: 8)
                        .font(.system(size: 45))
                        .foregroundColor(.yellow)
                }
                /*
                 Assignments of user inputs
                 */
                DataInput(title: "Causes of Stress", userInput: $stressResponse)
                DataInput(title: "Causes of Joy", userInput: $joyResponse)
                DataInput(title: "Notes", userInput: $notes)
                DataInput(title: "Date or Title", userInput: $time)
                Button(action: addNewMood) {
                    Text("Remember Mood!")
                    NavigationLink(destination: MoodList(), tag: 1, selection: $selection){
                        Button(""){
                            self.selection = 1
                        }
                    }
                }
                .frame(width: 275, height: 50, alignment: .center)
            }.padding(10)
    }
}
    /*
     Function responsible for creating new Mood Object
     */
    func addNewMood() {
        let newMood = Mood(id: UUID().uuidString, moodStress: stressResponse, moodJoy: joyResponse, moodNote: notes, moodTime: time)
        moodStore.moods.append(newMood)
    }
}

struct AddMood_Previews: PreviewProvider {
    static var previews: some View {
        AddMood(moodStore: MoodStore(moods:MoodData))
    }
}

/*
 Prompting text for user Data Input in text fields
 */
struct MoodDataInput: View {
    var title: String
    @Binding var userInput: String
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading) {
            Text(title)
                .font(.headline)
            TextField("What were some \(title)", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }
}
