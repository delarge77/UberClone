//
//  UberCloneApp.swift
//  UberClone
//
//  Created by Alessandro dos Santos Pinto on 2024-06-04.
//

import SwiftUI

@main
struct UberCloneApp: App {
    
    @State var locationViewModel = LocationSearchViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(locationViewModel)
        }
    }
}
