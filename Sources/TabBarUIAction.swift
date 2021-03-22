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
    private let screens: [TabScreen]

    public init(
        @ViewBuilder modal: @escaping () -> Modal,
        @ViewBuilder content: () -> TupleView<(TabScreen, TabScreen)>
    ) {
        let views = content().value
        self.modal = modal
        self.screens = [views.0, views.1]
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
            TabScreen { Text("aaa") }
            TabScreen { Text("aaa") }
        }
    }
}
