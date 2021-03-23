//
//  TabModal.swift
//  TabBarUIAction
//
//  Created by Fabrizio Duroni on 23/03/21.
//

import SwiftUI

public struct TabModal: View {
    public let content: AnyView
    public let modalTabBarItemContent: ModalTabBarItemContent

    public init<Content>(modalTabBarItemContent: ModalTabBarItemContent, @ViewBuilder content: () -> Content) where Content: View {
        self.modalTabBarItemContent = modalTabBarItemContent
        self.content = AnyView(content())
    }

    public var body: some View {
        Group {
            self.content
        }
    }
}
