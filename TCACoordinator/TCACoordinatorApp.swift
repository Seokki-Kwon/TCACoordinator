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
    let store = Store(initialState: AppCoordinatorReducer.State(routes: [.root(.splash(.init()))], mainTab: .initialState)) {
        AppCoordinatorReducer()
    }
    var body: some Scene {
        WindowGroup {
            AppCoordinatorView(store: store)
        }
    }
}
