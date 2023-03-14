//
//  AppModel.swift
//  QuickSweat
//
//  Created by Thomas Ortega II on 3/13/23.
//

import Foundation

class AppModel:ObservableObject {
    let exerciseMediator:BaseMediator
    init(exerciseMediator: BaseMediator) {
        self.exerciseMediator = exerciseMediator
    }
    
    @Published var exercises = [ExerciseDTO]()
    @Published var selectedExercise:ExerciseDTO?
    var muscleGroups = ["abdominals", "abductors", "adductors", "biceps", "calves", "chest", "forearms", "glutes", "hamstrings", "lats", "lower_back", "middle_back", "neck", "quadriceps", "traps", "triceps"]
    
    func findExercises(muscle:String) -> Void {
        exerciseMediator.searchForExcercises(muscleSelection: muscle) { exercises in
            print(exercises)
            self.exercises = exercises
        }
    }

}
