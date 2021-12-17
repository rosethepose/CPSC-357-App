//
//  MoodDetail.swift
//  MentalHealthApp (iOS)
//
//  Created by Jacob Dunkle on 12/16/21.
//

import SwiftUI

/*
 * selectedMood is the navigation link on showing the proper detailed page
 * Sky Blue colored pulled from Apple Developer Site: https://developer.apple.com/documentation/swiftui/color
 */

/*
 MoodDetail struct creates a summarized page of data entered by the user or from our example MoodData json file
 */
struct MoodDetail: View {
    let selectedMood: Mood
    let skyBlue = Color(red: 0.4627, green: 0.8392, blue: 1.0)
    var body: some View {
        Form{
            Section (header: Text( "Mood Journal Entry!")){
                Text(selectedMood.moodTime)
                    .font(.headline)
                    .padding()
                Image(systemName: "cloud.sun")
                    .resizable()
                    .cornerRadius(12.0)
                    .aspectRatio(contentMode: .fill)
                    .padding()
                    .foregroundColor(skyBlue)
                Text("Journaled Causes of Stress")
                    .font(.headline)
                Text(selectedMood.moodStress)
                Text("Journaled Causes of Joy")
                    .font(.headline)
                Text(selectedMood.moodJoy)
                Text("Notes")
                    .font(.headline)
                Text(selectedMood.moodNote)
                Spacer()
            }
        }
    }
}

/*
 Preview of a Mood Journal Entry Detailed Page.
 */
struct MoodDetail_Previews: PreviewProvider {
    static var previews: some View {
        MoodDetail(selectedMood: MoodData[0])
    }
}
