//
//  TabModal.swift
//  TabBarUIAction
//
//  Created by Fabrizio Duroni on 23/03/21.
//

import SwiftUI

public struct TabModal: View {
    public let content: AnyView

    public init<Content>(@ViewBuilder content: () -> Content) where Content: View {
        self.content = AnyView(content())
    }

    public var body: some View {
        Group {
            self.content
        }
    }
}
