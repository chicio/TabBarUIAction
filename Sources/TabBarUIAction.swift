//
//  TabBarUIAction.swift
//  TabBarUIAction
//
//  Created by Fabrizio Duroni on 21/03/21.
//

import SwiftUI

public struct TabBarUIAction<TabModal: View>: View {
    @State private var currentView: Tab = .tab1
    private var modal: TabModal
    private let screens: [TabScreen]

    public init(@ViewBuilder content: () -> TupleView<(TabScreen, TabModal, TabScreen)>) {
        let views = content().value
        self.modal = views.1
        self.screens = [views.0, views.2]
    }

    public var body: some View {
        VStack {
            self.screens[self.currentView.rawValue]
            TabBar(currentView: self.$currentView) {
                self.modal
            }
        }
        .ignoresSafeArea(.keyboard)
    }
}

struct TabBarUIAction_Previews: PreviewProvider {
    static var previews: some View {
        TabBarUIAction {
            TabScreen { Text("aaa") }
            TabModal { Text("Modal") }
            TabScreen { Text("aaa") }
        }
    }
}
