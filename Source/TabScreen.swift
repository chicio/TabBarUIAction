//
//  TabScreen.swift
//  TabBarUIAction iOS
//
//  Created by Fabrizio Duroni on 22/03/21.
//

import SwiftUI

/**
 A struct used to define the  tab screen.
 */
public struct TabScreen: View {
    let content: AnyView
    let tabItemContent: TabItemContent

    /**
     Creates a `TabScreen` instance.
     
     - parameter tabItem: the the tab item content.
     - parameter content: a `@ViewBuilder` that contains the tab screen content.
     */
    public init<Content: View>(tabItem: TabItemContent, @ViewBuilder content: @escaping () -> Content) {
        self.tabItemContent = tabItem
        self.content = AnyView(content())
    }

    /// The body of TabScreen. It creates a view with the modal tab screen content.
    public var body: some View {
        Group {
            self.content
        }
    }
}
