//
//  TabBarUIAction.swift
//  TabBarUIAction
//
//  Created by Fabrizio Duroni on 21/03/21.
//

import SwiftUI

public struct TabBarUIAction<Content: View>: View {
    @State private var currentView: Tab = .tab1
    @Binding private var showModal: Bool
    private let content: (Tab) -> Content

    public init(showModal: Binding<Bool>, @ViewBuilder content: @escaping (Tab) -> Content) {
        self._showModal = showModal
        self.content = content
    }

    public var body: some View {
        VStack {
            self.content(currentView)
            TabBar(currentView: self.$currentView, showModal: self.$showModal)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct TabBarUIAction_Previews: PreviewProvider {
    static var previews: some View {
        TabBarUIAction(showModal: .constant(false)) { _ in
            Text("Test")
        }
    }
}
