//
//  MoodList.swift
//  MentalHealthApp
//
//  Created by Jacob Dunkle on 12/17/21.
//

import SwiftUI
/*
 MoodList File meant to create a list view of all created Mood Journal Entries. Addable and Editable from here. Employs the SF symbol here in place of a more genuine representation of the user's mood.
 */
struct MoodList: View {
    @StateObject private var moodStore : MoodStore = MoodStore(moods:MoodData)
    var body: some View {
        NavigationView{
            List{
                ForEach (moodStore.moods){Mood in MoodListCell(mood:Mood)
                }
                .onDelete(perform: deleteItems)
                .onMove(perform: moveItems)
            }
            /*
             Learned .toolbar usage for Navigation Title from Apple Developer Forum: https://developer.apple.com/forums/thread/682614
             */
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Mood Tracker!")
                        .font(.largeTitle)
                        .accessibilityAddTraits(.isHeader)
                }
            }
            .navigationBarItems(leading: NavigationLink(destination: AddMood(moodStore: self.moodStore))
                                    {Text("Add")
            .foregroundColor(.blue)
            }, trailing: EditButton())
        }
    }
    /*
     Delete list item function similar to the one deployed in Project 2.
     */
    func deleteItems (at offsets: IndexSet){
        moodStore.moods.remove(atOffsets: offsets)
    }
    /*
     Move list item function similar to the one deployed in Project 2.
     */
    func moveItems (from source: IndexSet, to destination: Int){
        moodStore.moods.move(fromOffsets: source, toOffset: destination)
    }
}

struct MoodList_Previews: PreviewProvider {
    static var previews: some View {
        MoodList()
    }
}

/*
 MoodListCell struct initializes navigation to the proper MoodDetail View.
 */
struct MoodListCell: View {
    var mood : Mood
    var body: some View {
        NavigationLink(destination: MoodDetail(selectedMood:mood)){
            HStack{
                Image(systemName: "brain.head.profile")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 75)
                Text(mood.moodTime)
            }
        }
    }
}
