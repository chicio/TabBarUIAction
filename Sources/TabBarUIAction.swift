//
//  TabBarUIAction.swift
//  TabBarUIAction
//
//  Created by Fabrizio Duroni on 21/03/21.
//

import SwiftUI

public struct TabBarUIAction: View {
    @State private var currentView: Tab = .tab1
    private var modal: TabModal
    private let screens: [TabScreen]

    public init(@ViewBuilder content: () -> TupleView<(TabScreen, TabModal, TabScreen)>) {
        let views = content().value
        self.modal = views.1
        self.screens = [views.0, views.2]
    }

    public init(@ViewBuilder content: () -> TupleView<(TabScreen, TabScreen, TabModal, TabScreen, TabScreen)>) {
        let views = content().value
        self.modal = views.2
        self.screens = [views.0, views.1, views.3, views.4]
    }

    public var body: some View {
        VStack {
            self.screens[currentView.rawValue]
            TabBar(currentView: self.$currentView, numberOfTabs: self.screens.count) {
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
