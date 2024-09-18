//
//  TCACoordinatorApp.swift
//  TCACoordinator
//
//  Created by 권석기 on 9/13/24.
//

import SwiftUI
import ComposableArchitecture
import TCACoordinators

@main
struct TCACoordinatorApp: App {
    
    var body: some Scene {
        WindowGroup {
            AppCoordinatorView(store: Store(initialState: AppCoordinatorReducer.State(routes: [.root(.splash(.init()))]), reducer: {
                AppCoordinatorReducer()
            }))
        }
    }
}
