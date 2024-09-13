//
//  Screen.swift
//  TCACoordinator
//
//  Created by 권석기 on 9/13/24.
//

import SwiftUI
import ComposableArchitecture
import TCACoordinators

@Reducer(state: .equatable)
enum Screen {
    case home(Home)
    case numbersList(NumbersList)
    case numberDetail(NumberDetail)
}


// home
struct HomeView: View {
    let store: StoreOf<Home>
    
    var body: some View {
        VStack {
            Button("Start") {
                store.send(.startTapped)
            }
        }.navigationTitle("Home")
    }
}

@Reducer
struct Home {
    struct State: Equatable {
        let id = UUID()
    }
    
    enum Action {
        case startTapped
    }
}

// numbersList
struct NumbersListView: View {
    let store: StoreOf<NumbersList>
    
    var body: some View {
        Text("NumberList")
    }
}

@Reducer
struct NumbersList {
    @ObservableState
    struct State: Equatable {
        let id = UUID()
        let numbers: [Int]
    }
    
    enum Action {
        case numberSelected(Int)
    }
}

// numberDetail
struct NumberDetailView: View {
    let store: StoreOf<NumberDetail>
    
    var body: some View {
        Text("NumberDetail")
    }
}

@Reducer
struct NumberDetail {
    @ObservableState
    struct State: Equatable {
        let id = UUID()
        var number: Int
    }
    
    enum Action {
       case none
    }
}
