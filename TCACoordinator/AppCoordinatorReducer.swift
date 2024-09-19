//
//  AppCoordinatorReducer.swift
//  TCACoordinator
//
//  Created by 권석기 on 9/19/24.
//

import SwiftUI
import ComposableArchitecture
import TCACoordinators

@Reducer(state: .equatable)
enum AppScreen {
    case mainTab(MainTabReducer)
    case onBoarding(OnboardingReducer)
    case splash(SplashReducer)
}

@Reducer
struct AppCoordinatorReducer {
    @ObservableState
    struct State {
        var routes: [Route<AppScreen.State>]
        var mainTab: MainTabReducer.State
    }
    
    enum Action {
        case router(IndexedRouterActionOf<AppScreen>)
        case mainTab(MainTabReducer.Action)
    }
    
    var body: some ReducerOf<Self> {
        Scope(state: \.mainTab, action: \.mainTab) {
            MainTabReducer()
        }
        
        Reduce<State, Action> { state, action in
            switch action {
            case .mainTab(.setting(.logout)):
                state.routes = [.root(.onBoarding(.init()))]
                return .none
            case .router(.routeAction(_, action: .splash(.loginRequest(let isSuccess)))):
                if isSuccess {
                    state.routes = [.root(.mainTab(.initialState))]
                } else {
                    state.routes = [.root(.onBoarding(.init()))]
                }
            case .router(.routeAction(_, action: .onBoarding(.login))):
                state.routes = [.root(.mainTab(.initialState))]
            default:
                break
            }
            return .none
        }
        .forEachRoute(\.routes, action: \.router)
    }
}


// reducer
@Reducer
struct MainTabReducer {
    enum Tab: Hashable {
        case home, setting
    }
    
    @ObservableState
    struct State: Equatable {
        static let initialState = State(home: .init(), setting: .init())
        var home: HomeScreenReducer.State
        var setting: SettingScreenReducer.State
    }
    
    enum Action {
        case home(HomeScreenReducer.Action)
        case setting(SettingScreenReducer.Action)
    }
    
    var body: some ReducerOf<Self> {
        Scope(state: \.setting, action: \.setting) {
            SettingScreenReducer()
        }
        Reduce { state, action in
            switch action {
            case .setting(.logout):
                print("로그아웃")
                return .none
            default:
                return .none
            }
        }
    }
}

@Reducer
struct OnboardingReducer {
    struct State: Equatable {
        let id = UUID()
    }
    
    enum Action {
        case login
    }
}

@Reducer
struct SplashReducer {
    struct State: Equatable {
        let id = UUID()
    }
    
    enum Action {
        case loginRequest(Bool)
    }
}
