//
//  TabScreen.swift
//  TabBarUIAction iOS
//
//  Created by Fabrizio Duroni on 22/03/21.
//

import SwiftUI

public struct TabScreen<Content: View>: View {
    public let content: () -> Content

    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    public var body: some View {
        Group {
            self.content()
        }
    }
}
