//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Arkasha Zuev on 10.06.2021.
//

import CoreData
import SwiftUI

enum predicate {
    case begingWith
}

struct FilteredList<T: NSManagedObject, Content: View>: View {
    var fetchRequest: FetchRequest<T>
    var items: FetchedResults<T> { fetchRequest.wrappedValue }
    
    let content: (T) -> Content
    
    var body: some View {
        List(items, id: \.self) { item in
            content(item)
        }
    }
    
    init(filterKey: String, filterValue: String, predicate: predicate, sortDescriptors: [NSSortDescriptor], @ViewBuilder content: @escaping (T) -> Content) {
        
        var formatOfPredicate = ""
        
        switch predicate {
            case .begingWith:
                formatOfPredicate = "%K BEGINSWITH %@"
        }
        
        fetchRequest = FetchRequest<T>(entity: T.entity(), sortDescriptors: sortDescriptors, predicate: NSPredicate(format: formatOfPredicate, filterKey, filterValue))
        self.content = content
    }
}
