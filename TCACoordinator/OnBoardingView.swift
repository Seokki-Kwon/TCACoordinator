//
//  OnBoardingView.swift
//  TCACoordinator
//
//  Created by 권석기 on 9/19/24.
//

import SwiftUI
import ComposableArchitecture
import TCACoordinators

struct OnBoardingView: View {
    let store: StoreOf<OnboardingReducer>
    
    var body: some View {
        Button(action: {
            store.send(.login)
        }, label: {
            Text("Login")
        })
    }
}
