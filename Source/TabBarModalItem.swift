//
//  ShowModalTabBarItem.swift
//  CustomTabBar
//
//  Created by Fabrizio Duroni on 06.03.20.
//

import SwiftUI

public struct TabBarModalItem: View {
    let modalTabBarItemContent: AnyView
    let action: () -> Void

    public init(modalTabBarItemContent: AnyView, action: @escaping () -> Void) {
        self.modalTabBarItemContent = modalTabBarItemContent
        self.action = action
    }

    public var body: some View {
        Group {
            VStack(spacing: 0) {
                self.modalTabBarItemContent
            }
            .onTapGesture(perform: action)
        }
    }
}
