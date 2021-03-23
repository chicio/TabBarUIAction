//
//  TabScreen.swift
//  TabBarUIAction iOS
//
//  Created by Fabrizio Duroni on 22/03/21.
//

import SwiftUI

public struct TabScreen: View {
    public let content: AnyView

    public init<Content: View>(@ViewBuilder content: @escaping () -> Content) {
        self.content = AnyView(content())
    }

    public var body: some View {
        Group {
            self.content
        }
    }
}
