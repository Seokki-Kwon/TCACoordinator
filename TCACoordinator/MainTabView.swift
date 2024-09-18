//
//  MainTabView.swift
//  TCACoordinator
//
//  Created by 권석기 on 9/19/24.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeScreenView()
                .tabItem {
                    Label(
                        title: { Text("home") },
                        icon: { Image(systemName: "house") }
                    )
                }
            
            SettingView()
                .tabItem {
                    Label(
                        title: { Text("Setting") },
                        icon: { Image(systemName: "gear") }
                    )
                }
        }
    }
}
