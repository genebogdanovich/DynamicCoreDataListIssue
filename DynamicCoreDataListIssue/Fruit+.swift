//
//  Fruit+.swift
//  DynamicCoreDataListIssue
//
//  Created by Gene Bogdanovich on 25.03.22.
//

import CoreData

extension Fruit {
    static func addStarterFruits(in context: NSManagedObjectContext) throws {
        let names = [
        "Apple",
        "Banana",
        "Orange",
        "Mango",
        "Grapes",
        "Pineapple",
        "Avocado",
        "Coconut",
        "Watermelon",
        ]
        
        for name in names {
            let fruit = Fruit(context: context)
            fruit.name = name
            
        }
        
        try context.save()
    }
}
