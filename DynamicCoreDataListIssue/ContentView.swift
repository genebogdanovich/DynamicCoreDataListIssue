//
//  ContentView.swift
//  DynamicCoreDataListIssue
//
//  Created by Gene Bogdanovich on 25.03.22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var garden: Garden
    
    var body: some View {
        NavigationView {
            NavigationLink("Pick Fruits in the Garden 🏡") {
                FruitPicker(selection: $garden.fruits.setBinding())
            }
        }
    }
}
