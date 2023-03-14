//
//  ExerciseDetail.swift
//  QuickSweat
//
//  Created by Thomas Ortega II on 3/14/23.
//

import SwiftUI

struct ExerciseDetail: View {
    var exercise:ExerciseDTO
    @State var liked = false
    @EnvironmentObject private var appModel:AppModel

    var body: some View {
        VStack (alignment:.center) {
            ScrollView {
                Text(exercise.name).bold().padding()
                Text(exercise.instructions)
            }.frame(alignment: .leading)
            Button {
                liked.toggle()
                if liked {
                    appModel.saveFaveExcercise(exercise: exercise)
                } else {
                    appModel.removeFaveExcercise(exercise: exercise)
                }
            } label: {
                if liked {
                    Image(systemName: "hand.thumbsup.fill")
                        .foregroundColor(Color.accentColor)
                } else {
                    Image(systemName: "hand.thumbsup.fill")
                        .foregroundColor(Color.black)
                }
            }
        }.task {
            liked = appModel.isFaveExcercise(exercise: exercise)
        }.padding()
    }
}

struct ExerciseDetail_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseDetail(exercise: ExerciseDTO.retrieveSampleValues())
    }
}
