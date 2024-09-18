//
//  Splash.swift
//  TCACoordinator
//
//  Created by 권석기 on 9/19/24.
//

import SwiftUI
import ComposableArchitecture
import TCACoordinators

struct SplashView: View {
    let store: StoreOf<SplashReducer>
    
    var body: some View {
        Text("Splash")
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    store.send(.loginRequest(false))
                }
            }
    }
}

//#Preview {
//    SplashView()
//}
