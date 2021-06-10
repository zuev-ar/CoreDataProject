//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Arkasha Zuev on 10.06.2021.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            OneToManyRelationshipsContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
