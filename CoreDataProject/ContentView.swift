//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Arkasha Zuev on 10.06.2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var moc

//    NSPredicate(format: "universe == %@", "Star Wars")
//    NSPredicate(format: "universe < %@", "F")
//    NSPredicate(format: "universe IN %@", ["Aliens", "Firefly", "Star Trek"])
//    NSPredicate(format: "universe BEGINSWITH %@", "E")
//    @FetchRequest(entity: Singer.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Singer.firstName, ascending: true)], predicate: nil)
//    private var singers: FetchedResults<Singer>
    @State private var lastNameFilter = "A"

    var body: some View {
        VStack {
            FilteredList(filterKey: "lastName", filterValue: lastNameFilter) { (singer: Singer) in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }
            
            Button("Add") {
                let taylor = Singer(context: moc)
                taylor.firstName = "Taylor"
                taylor.lastName = "Swift"

                let ed = Singer(context: moc)
                ed.firstName = "Ed"
                ed.lastName = "Sheeran"

                let adele = Singer(context: moc)
                adele.firstName = "Adele"
                adele.lastName = "Adkins"
            }
            .padding()
            
            Button("Show A") {
                lastNameFilter = "A"
            }
            .padding()
            
            Button("Show S") {
                lastNameFilter = "S"
            }
            
            Button("Save") {
                if moc.hasChanges {
                    do {
                        try moc.save()
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
