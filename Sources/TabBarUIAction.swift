//
//  TabBarUIAction.swift
//  TabBarUIAction
//
//  Created by Fabrizio Duroni on 21/03/21.
//

import SwiftUI

public struct TabBarUIAction<Modal: View, C0: View, C1: View>: View {
    @State private var currentView: Tab = .tab1
    private var modal: () -> Modal
    private let content: (C0, C1)

    public init(
        @ViewBuilder modal: @escaping () -> Modal,
        @ViewBuilder content: () -> TupleView<(C0, C1)>
    ) {
        self.modal = modal
        self.content = content().value
    }

    public var body: some View {
        VStack {
            if currentView == .tab1 {
                self.content.0
            } else {
                self.content.1
            }
            TabBar(currentView: self.$currentView) {
                self.modal()
            }
        }
    }
}

struct TabBarUIAction_Previews: PreviewProvider {
    static var previews: some View {
        TabBarUIAction {
            Text("Modal")
        } content: {
            Text("aaa")
            Text("aaa")
        }
    }
}
