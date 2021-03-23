//
//  TabBarUIAction.swift
//  TabBarUIAction
//
//  Created by Fabrizio Duroni on 21/03/21.
//

import SwiftUI

public struct TabBarUIAction<TabModal: View, TabScreen1: View & Equatable, TabScreen2: View & Equatable>: View {
    @State private var currentView: Tab = .tab1
    private var modal: TabModal
    private let tabScreen1: TabScreen<TabScreen1>
    private let tabScreen2: TabScreen<TabScreen2>

    public init(@ViewBuilder content: () -> TupleView<(TabScreen<TabScreen1>, TabModal, TabScreen<TabScreen2>)>) {
        let views = content().value
        self.modal = views.1
        self.tabScreen1 = views.0
        self.tabScreen2 = views.2
    }

    public var body: some View {
        VStack {
            if currentView == .tab1 {
                self.tabScreen1
            }
            if currentView == .tab2 {
                self.tabScreen2
            }
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
