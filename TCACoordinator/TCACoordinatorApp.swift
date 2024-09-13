//
//  TCACoordinatorApp.swift
//  TCACoordinator
//
//  Created by 권석기 on 9/13/24.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCACoordinatorApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView(store: Store(initialState: Coordinator.State(routes: [.root(.home)]), reducer: {
                Coordinator()
            }))
        }
    }
}
