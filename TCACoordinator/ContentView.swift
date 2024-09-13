//
//  ContentView.swift
//  TCACoordinator
//
//  Created by 권석기 on 9/13/24.
//

import SwiftUI
import ComposableArchitecture
import TCACoordinators

struct ContentView: View {
    @State var store: StoreOf<Coordinator>
    
    var body: some View {
        TCARouter(store.scope(state: \.routes, action: \.router)) { screen in
            switch screen.case {
            case let .home(store):
                HomeView(store: store)
            case let .numbersList(store):
                NumbersListView(store: store)                
            case let .numberDetail(store):
                NumberDetailView(store: store)
            }
        }
    }
}

extension Screen.State: Identifiable {
  var id: UUID {
    switch self {
    case let .home(state):
      state.id
    case let .numbersList(state):
      state.id
    case let .numberDetail(state):
      state.id
    }
  }
}

//#Preview {
//    ContentView()
//}
