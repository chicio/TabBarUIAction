//
//  TabBarUIAction.swift
//  TabBarUIAction
//
//  Created by Fabrizio Duroni on 21/03/21.
//

import SwiftUI

public struct TabBarUIAction: View {
    @Binding private var currentView: TabPosition
    @Binding private var showModal: Bool
    private var modal: TabModal
    private let tabItemsProperties: [TabItemProperties]
    private let colors: Colors

    public init(
        currentTab: Binding<TabPosition>,
        showModal: Binding<Bool>,
        colors: Colors,
        @ViewBuilder content: () -> TupleView<(TabScreen, TabModal, TabScreen)>
    ) {
        self._currentView = currentTab
        self._showModal = showModal
        let views = content().value
        self.modal = views.1
        self.tabItemsProperties = [
            TabItemProperties(position: .tab1, screen: views.0),
            TabItemProperties(position: .tab2, screen: views.2)
        ]
        self.colors = colors
    }

    public init(
        currentTab: Binding<TabPosition>,
        showModal: Binding<Bool>,
        colors: Colors,
        @ViewBuilder content: () -> TupleView<(TabScreen, TabScreen, TabModal, TabScreen, TabScreen)>
    ) {
        self._currentView = currentTab
        self._showModal = showModal
        let views = content().value
        self.modal = views.2
        self.tabItemsProperties = [
            TabItemProperties(position: .tab1, screen: views.0),
            TabItemProperties(position: .tab2, screen: views.1),
            TabItemProperties(position: .tab3, screen: views.3),
            TabItemProperties(position: .tab4, screen: views.4)
        ]
        self.colors = colors
    }

    public var body: some View {
        VStack {
            tabItemsProperties[currentView.rawValue].screen
                .accessibility(identifier: "TabScreen\(currentView.rawValue + 1)")
            TabBar(
                currentView: $currentView,
                showModal: $showModal,
                tabItemColors: colors.tabItemColors,
                tabItems: tabItemsProperties,
                modal: modal
            )
            .background(
                colors.tabBarBackgroundColor
                    .ignoresSafeArea()
                    .accessibility(identifier: "TabBarUIActionBackground")
            )
        }
        .ignoresSafeArea(.keyboard)
        .accessibilityElement(children: .contain)
        .accessibility(identifier: "TabBarUIAction")
    }
}
