//
//  Coordinator.swift
//  TCACoordinator
//
//  Created by 권석기 on 9/13/24.
//

import Foundation
import ComposableArchitecture
import TCACoordinators

// 여러 화면을 관리
// 해당 배열에 새 화면 상태를 추가하면 화면을 push 가능
@Reducer
struct Coordinator {
    @ObservableState
    struct State: Equatable {
        static let initialState = State(
            routes: [.root(.home(.init()), embedInNavigationView: true)]
        )
        
        var routes: [Route<Screen.State>] = []
    }
    
    enum Action {
        case router(IndexedRouterActionOf<Screen>)
    }
    
    var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            case .router(.routeAction(_, .home(.startTapped))):
                state.routes.presentSheet(.numbersList(.init(numbers: Array(0..<4))), embedInNavigationView: true)
            case .router(.routeAction(_, action: .numbersList(.numberSelected(let number)))):
                state.routes.push(.numberDetail(.init(number: number)))
            default:
                break
            }
            return .none
        }
        .forEachRoute(\.routes, action: \.router)
    }
}
