//
//  TabBarUIAction.swift
//  TabBarUIAction
//
//  Created by Fabrizio Duroni on 21/03/21.
//

import SwiftUI

public struct TabBarUIAction<Modal: View, Content: View>: View {
    @State private var currentView: Tab = .tab1
    private var modal: () -> Modal
    private let content: (Tab) -> Content

    public init(
        @ViewBuilder modal: @escaping () -> Modal,
        @ViewBuilder content: @escaping (Tab) -> Content
    ) {
        self.modal = modal
        self.content = content
    }

    public var body: some View {
        VStack {
            self.content(currentView)
            TabBar(currentView: self.$currentView) {
                self.modal()
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct TabBarUIAction_Previews: PreviewProvider {
    static var previews: some View {
        TabBarUIAction {
            Text("Modal")
        } content: { _ in
            Text("Content")
        }
    }
}
