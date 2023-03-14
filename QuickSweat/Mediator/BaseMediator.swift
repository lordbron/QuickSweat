//
//  BaseMediator.swift
//  QuickSweat
//
//  Created by Thomas Ortega II on 3/13/23.
//

import Foundation

protocol BaseMediator {
    func searchForExcercises(muscleSelection:String, exerciseDataHandler:@escaping (_ exercises:[ExerciseDTO]) -> Void) -> Void
    
    func loadFaveExcercises() -> Void
}
