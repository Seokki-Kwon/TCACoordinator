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
    let store: StoreOf<SettingScreenReducer>
    
    var body: some View {
        List {
            Button(action: {
                store.send(.logout)
            }, label: {
                Text("Logout")
            })
        }
    }
}

@Reducer
struct HomeScreenReducer {
   
    @ObservableState
    struct State: Equatable {
        
    }
    
    enum Action {}
}

@Reducer
struct SettingScreenReducer {
   
    @ObservableState
    struct State: Equatable {
        
    }
    
    enum Action {
        case logout
    }
}
