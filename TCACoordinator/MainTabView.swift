//
//  MainTabView.swift
//  TCACoordinator
//
//  Created by 권석기 on 9/19/24.
//

import SwiftUI
import ComposableArchitecture
import TCACoordinators

struct MainTabView: View {
 var store: StoreOf<MainTabReducer>
    
    var body: some View {
        WithPerceptionTracking {
            TabView {
                HomeScreenView()
                    .tabItem {
                        Label(
                            title: { Text("home") },
                            icon: { Image(systemName: "house") }
                        )
                    }
                
                SettingView(store: store.scope(state: \.setting, action: \.setting))
                    .tabItem {
                        Label(
                            title: { Text("Setting") },
                            icon: { Image(systemName: "gear") }
                        )
                    }
            }
        }
    }
}
