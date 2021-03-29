//
//  ShowModalTabBarItem.swift
//  CustomTabBar
//
//  Created by Fabrizio Duroni on 06.03.20.
//

import SwiftUI

struct TabBarModalItem: View {
    private let modalTabBarItemContent: AnyView
    private let action: () -> Void

    init(modalTabBarItemContent: AnyView, action: @escaping () -> Void) {
        self.modalTabBarItemContent = modalTabBarItemContent
        self.action = action
    }

    var body: some View {
        Group {
            VStack(spacing: 0) {
                self.modalTabBarItemContent
            }
            .onTapGesture(perform: action)
        }
    }
}
