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
    
}