//
//  TabBarUIAction.swift
//  TabBarUIAction
//
//  Created by Fabrizio Duroni on 21/03/21.
//

import SwiftUI

public struct TabItem: Identifiable {
    // swiftlint:disable:next identifier_name
    public var id: Int { position.rawValue }
    let position: TabPosition
    let screen: TabScreen
}

public struct TabBarUIAction: View {
    @State private var currentView: TabPosition = .tab1
    private var modal: TabModal
    private let tabItems: [TabItem]

    public init(@ViewBuilder content: () -> TupleView<(TabScreen, TabModal, TabScreen)>) {
        let views = content().value
        self.modal = views.1
        self.tabItems = [
            TabItem(position: .tab1, screen: views.0),
            TabItem(position: .tab2, screen: views.2)
        ]
    }

    public init(@ViewBuilder content: () -> TupleView<(TabScreen, TabScreen, TabModal, TabScreen, TabScreen)>) {
        let views = content().value
        self.modal = views.2
        self.tabItems = [
            TabItem(position: .tab1, screen: views.0),
            TabItem(position: .tab2, screen: views.1),
            TabItem(position: .tab3, screen: views.3),
            TabItem(position: .tab4, screen: views.4)
        ]
    }

    public var body: some View {
        VStack {
            self.tabItems[currentView.rawValue].screen
            TabBar(currentView: self.$currentView, tabItems: self.tabItems) {
                self.modal
            }
        }
        .ignoresSafeArea(.keyboard)
    }
}

struct TabBarUIAction_Previews: PreviewProvider {
    static var previews: some View {
        TabBarUIAction {
            TabScreen(tabItem: TabItemContent()) { Text("aaa") }
            TabModal { Text("Modal") }
            TabScreen(tabItem: TabItemContent()) { Text("aaa") }
        }
    }
}
