//
//  AppModel.swift
//  QuickSweat
//
//  Created by Thomas Ortega II on 3/13/23.
//

import Foundation
import CoreData

class AppModel:ObservableObject {
    let exerciseMediator:BaseMediator
    init(exerciseMediator: BaseMediator) {
        self.exerciseMediator = exerciseMediator
        viewContext = result.container.viewContext
        loadLocalFaveExercises()
    }
    
    let result = PersistenceController.shared
    let viewContext: NSManagedObjectContext
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
            saveExerciseLocally(exercise)
        }
    }

    func loadLocalFaveExercises() -> Void {
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "Exercise")
        let sort = NSSortDescriptor(key: "name", ascending: false)
        fetchRequest.sortDescriptors = [sort]
        do {
            let localFaves = try viewContext.fetch(fetchRequest) as? [Exercise] ?? [Exercise]()
            if !localFaves.isEmpty {
                var allFaves = [ExerciseDTO]()
                for exercise in localFaves {
                    let fave = ExerciseDTO.convertCDToMe(exercise: exercise)
                    allFaves.append(fave)
                }
                likedExercises = allFaves
            }
        } catch {
        }

    }
    
    func saveExerciseLocally(_ exercise:ExerciseDTO) -> Void {
        let newExercise = Exercise(context: viewContext)
        newExercise.difficulty = exercise.difficulty
        newExercise.name = exercise.name
        newExercise.muscle = exercise.muscle
        newExercise.instructions = exercise.instructions
        newExercise.equipment = exercise.equipment
        do {
            try viewContext.save()

        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        }

    }
    
    func removeFaveExcercise(exercise:ExerciseDTO) -> Void {
        if let index = likedExercises.firstIndex(where: {$0.name == exercise.name}) {
            likedExercises.remove(at: index)
            print("removed")
        }
    }

    func isFaveExcercise(exercise:ExerciseDTO) -> Bool {
        if (likedExercises.contains{$0.name == exercise.name}) {
            return true
        } else {
            return false
        }
    }
}
