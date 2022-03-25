//
//  DynamicCoreDataListIssueApp.swift
//  DynamicCoreDataListIssue
//
//  Created by Gene Bogdanovich on 25.03.22.
//

import SwiftUI

extension Binding {
    func setBinding<Type>() -> Binding<Set<Type>> where Value == NSSet? {
        Binding<Set<Type>> {
            wrappedValue as? Set<Type> ?? []
        } set: {
            self.wrappedValue = NSSet(set: $0)
        }
    }
}

@main
struct DynamicCoreDataListIssueApp: App {
    @StateObject private var controller = PersistenceController()
    
    var body: some Scene {
        WindowGroup {
            makeContentView()
                .environmentObject(controller)
                .environment(\.managedObjectContext, controller.container.viewContext)
                .onAppear(perform: addStarterFruitsIfNeeded)
        }
    }
    
    func makeContentView() -> some View {
        let garden = Garden(context: controller.container.viewContext)
        return ContentView(garden: garden)
    }
    
    func addStarterFruitsIfNeeded() {
        let taskContext = controller.container.newBackgroundContext()
        try? Fruit.addStarterFruits(in: taskContext)
    }
}
