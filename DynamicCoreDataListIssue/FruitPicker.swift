//
//  FruitPicker.swift
//  DynamicCoreDataListIssue
//
//  Created by Gene Bogdanovich on 25.03.22.
//

import SwiftUI
import CoreData

struct FruitPicker: View {
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Fruit.name, ascending: true)],
        animation: .default)
    private var fruits: FetchedResults<Fruit>
    
    @Binding var selection: Set<Fruit>
    @State var searchText = ""
    
    var body: some View {
        List(fruits, id: \.self, selection: $selection) {
            Text($0.name ?? "")
        }
        .searchable(text: query)
        .environment(\.editMode, .constant(EditMode.active))
        .navigationTitle("Garden")
    }
    
    var query: Binding<String> {
        Binding {
            searchText
        } set: { newValue in
            searchText = newValue
            
            fruits.nsPredicate = newValue.isEmpty ? nil : NSPredicate(format: "name CONTAINS[cd] %@", newValue)
        }
    }
}
