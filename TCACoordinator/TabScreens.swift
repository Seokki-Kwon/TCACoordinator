//
//  TabScreens.swift
//  TCACoordinator
//
//  Created by 권석기 on 9/19/24.
//

import SwiftUI
import ComposableArchitecture
import TCACoordinators

struct HomeScreenView: View {
    var body: some View {
        Text("HomeView")
    }
}

struct SettingView: View {
    
    var body: some View {
        List {
            Button(action: {
                
            }, label: {
                Text("Logout")
            })
        }
    }
}
