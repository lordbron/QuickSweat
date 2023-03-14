//
//  ContentView.swift
//  QuickSweat
//
//  Created by Thomas Ortega II on 3/13/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject private var appModel:AppModel

    var body: some View {
        TabView {
            NavigationView {
                VStack {
                    List {
                        Text("choose_muscle")
                        ForEach(appModel.muscleGroups, id:\.self) { muscle in
                            NavigationLink {
                                List {
                                    ForEach(appModel.exercises, id:\.name) { exercise in
                                        NavigationLink {
                                            ExerciseDetail(exercise: exercise)
                                        } label: {
                                            Text(exercise.name.capitalized)
                                        }
                                    }
                                }.onAppear{
                                    appModel.findExercises(muscle: muscle)
                                }.navigationBarTitle("exercises")
                            } label: {
                                Text(LocalizedStringKey(muscle))
                            }
                        }
                    }
                    .navigationBarTitle("muscle_group")
                }
            }
            .tabItem{
                VStack {
                    Image(systemName: "figure.run")
                        .foregroundColor(Color.black)
                }
            }
            NavigationView {
                VStack {
                    Text("faves")
                    List {
                        ForEach(appModel.likedExercises, id:\.name) { exercise in
                            NavigationLink {
                                ExerciseDetail(exercise: exercise)
                            } label: {
                                Text(exercise.name.capitalized)
                            }
                        }
                    }
                    .navigationBarTitle("muscle_group")
                }
            }
            .tabItem{
                VStack {
                    Image(systemName: "hand.thumbsup.fill")
                        .foregroundColor(Color.black)
                }
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
