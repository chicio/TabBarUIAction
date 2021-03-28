//
//  TabModal.swift
//  TabBarUIAction
//
//  Created by Fabrizio Duroni on 23/03/21.
//

import SwiftUI

public struct TabModal: View {
    public let content: AnyView
    public let modalTabBarItemContent: AnyView

    public init<Content, ModalContent>(
        @ViewBuilder modalTabBarItemContent: () -> Content,
        @ViewBuilder content: () -> ModalContent
    ) where Content: View, ModalContent: View {
        self.modalTabBarItemContent = AnyView(modalTabBarItemContent())
        self.content = AnyView(content())
    }

    public var body: some View {
        Group {
            self.content
        }
    }
}
