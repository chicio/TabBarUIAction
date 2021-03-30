//
//  TabModal.swift
//  TabBarUIAction
//
//  Created by Fabrizio Duroni on 23/03/21.
//

import SwiftUI

/**
 A struct used to define the  modal tab screen.
 */
public struct TabModal: View {
    let content: AnyView
    let modalTabBarItemContent: AnyView

    /**
     Creates a `TabModal` instance.
     
     - parameter modalTabBarItemContent:a `@ViewBuilder` that contains the modal tab bar item.
     - parameter content: a `@ViewBuilder` that contains the content of the tab bar modal screen.
     */
    public init<Content, ModalContent>(
        @ViewBuilder modalTabBarItemContent: () -> Content,
        @ViewBuilder content: () -> ModalContent
    ) where Content: View, ModalContent: View {
        self.modalTabBarItemContent = AnyView(modalTabBarItemContent())
        self.content = AnyView(content())
    }

    /// The body of TabModal. It creates a view with the modal tab content.
    public var body: some View {
        Group {
            self.content
        }
    }
}
