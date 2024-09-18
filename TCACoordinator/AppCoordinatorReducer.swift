//
//  AppCoordinatorReducer.swift
//  TCACoordinator
//
//  Created by 권석기 on 9/19/24.
//

import Foundation
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
    struct State: Equatable {
        static let initialState = State(
                routes: [.root(.splash(.init()))]
               )
        var routes: [Route<AppScreen.State>]
    }
    
    enum Action {
        case router(IndexedRouterActionOf<AppScreen>)
    }
    
    var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            case .router(.routeAction(_, action: .mainTab(.init()))):
                state.routes.push(.mainTab(.init()))
            case .router(.routeAction(_, action: .splash(.loginRequest(let isSuccess)))):
                if isSuccess {
                    state.routes = [.root(.mainTab(.init()))]
                } else {
                    state.routes = [.root(.onBoarding(.init()))]
                }
            case .router(.routeAction(_, action: .onBoarding(.login))):
                state.routes = [.root(.mainTab(.init()))]
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
    struct State: Equatable {
        let id = UUID()
    }
    
    enum Action {}
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
