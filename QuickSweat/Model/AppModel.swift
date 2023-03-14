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
    @Published var likedExercises = [ExerciseDTO]()
    @Published var selectedExercise:ExerciseDTO?
    var muscleGroups = ["abdominals", "abductors", "adductors", "biceps", "calves", "chest", "forearms", "glutes", "hamstrings", "lats", "lower_back", "middle_back", "neck", "quadriceps", "traps", "triceps"]
    
    func findExercises(muscle:String) -> Void {
        exerciseMediator.searchForExcercises(muscleSelection: muscle) { exercises in
            DispatchQueue.main.async {
                self.exercises = exercises
            }
        }
    }

    func saveFaveExcercise(exercise:ExerciseDTO) -> Void {
        if (!likedExercises.contains{$0.name == exercise.name}) {
            likedExercises.append(exercise)
        }
    }
    
    func removeFaveExcercise(exercise:ExerciseDTO) -> Void {
        if let index = likedExercises.firstIndex(where: {$0.name == exercise.name}) {
            likedExercises.remove(at: index)
            print("removed")
        }
    }

    func isFaveExcercise(exercise:ExerciseDTO) -> Bool {
        if likedExercises.contains(where: {$0.name == exercise.name}) {
            return true
        } else {
            return false
        }
    }
}
