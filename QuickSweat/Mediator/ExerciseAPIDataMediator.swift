//
//  ExerciseAPIDataMediator.swift
//  QuickSweat
//
//  Created by Thomas Ortega II on 3/13/23.
//

import Foundation

struct ExerciseAPIDataMediator:BaseMediator {
    let apiVersion = "https://api.api-ninjas.com/v1/"
    
    func searchForExcercises(muscleSelection:String, exerciseDataHandler:@escaping (_ exercises:[ExerciseDTO]) -> Void) -> Void {
        let muscle = muscleSelection.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: apiVersion+"exercises?muscle="+muscle!)!
        var request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
            guard let data = data else { return }
            //print(String(data: data, encoding: .utf8)!)
            let exercises = try? JSONDecoder().decode([ExerciseDTO].self, from: data)
            exerciseDataHandler(exercises ?? [ExerciseDTO]())
            
        }
        task.resume()
    }

    func loadFaveExcercises() -> Void {
        
    }
    
}
