//
//  TabBarUIAction.swift
//  TabBarUIAction
//
//  Created by Fabrizio Duroni on 21/03/21.
//

import SwiftUI

public struct TabBarUIAction<Modal: View>: View {
    @State private var currentView: Tab = .tab1
    private var modal: () -> Modal
    private let screens: [AnyView]

    public init<C0, C1>(
        @ViewBuilder modal: @escaping () -> Modal,
        @ViewBuilder content: () -> TupleView<(C0, C1)>
    ) where C0: View, C1: View {
        let views = content().value
        self.modal = modal
        self.screens = [AnyView(views.0), AnyView(views.1)]
    }

    public var body: some View {
        VStack {
            self.screens[self.currentView.rawValue]
            TabBar(currentView: self.$currentView) {
                self.modal()
            }
        }
        .ignoresSafeArea(.keyboard)
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
