//
//  QuickSweatApp.swift
//  QuickSweat
//
//  Created by Thomas Ortega II on 3/13/23.
//

import SwiftUI

@main
struct QuickSweatApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
