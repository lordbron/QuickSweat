//
//  ExerciseDTO.swift
//  QuickSweat
//
//  Created by Thomas Ortega II on 3/13/23.
//

import Foundation

struct ExerciseDTO:Codable {
    let difficulty:String
    let equipment:String
    let instructions:String
    let muscle:String
    let name:String
    let type:String
    
    static func convertCDToMe(exercise: Exercise) -> ExerciseDTO {
        return ExerciseDTO(
            difficulty: exercise.difficulty ?? "",
            equipment: exercise.equipment ?? "",
            instructions: exercise.instructions ?? "",
            muscle: exercise.muscle ?? "",
            name: exercise.name ?? "",
            type: exercise.type ?? ""
        )
    }
    
    static func retrieveSampleValues() -> ExerciseDTO {
        return ExerciseDTO(
            difficulty: "beginner",
            equipment: "dumbbell",
            instructions: "Seat yourself on an incline bench with a dumbbell in each hand. You should pressed firmly against he back with your feet together. Allow the dumbbells to hang straight down at your side, holding them with a neutral grip. This will be your starting position. Initiate the movement by flexing at the elbow, attempting to keep the upper arm stationary. Continue to the top of the movement and pause, then slowly return to the start position.",
            muscle: "biceps",
            name: "Incline Hammer Curls",
            type: "strength"
        )
    }
}
