//
//  AppCoordinatorView.swift
//  TCACoordinator
//
//  Created by 권석기 on 9/19/24.
//

import SwiftUI
import ComposableArchitecture
import TCACoordinators

struct AppCoordinatorView: View {
    let store: StoreOf<AppCoordinatorReducer>
    
    var body: some View {
        TCARouter(store.scope(state: \.routes, action: \.router)) { screen in
            switch screen.case {
            case .mainTab:
                MainTabView(store: store.scope(state: \.mainTab, action: \.mainTab))
            case let .onBoarding(store):
                OnBoardingView(store: store)
            case let .splash(store):
                SplashView(store: store)
            }
        }
    }
}

//#Preview {
//    AppCoordinatorView(store: .init(initialState: AppCoordinatorReducer.State, reducer: {
//        AppCoordinatorReducer()
//    }))
//}
