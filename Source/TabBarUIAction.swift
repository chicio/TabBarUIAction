//
//  TabBarUIAction.swift
//  TabBarUIAction
//
//  Created by Fabrizio Duroni on 21/03/21.
//

import SwiftUI

/**
 The TabBArUIAction component.
 This is the main component that contains all the other parts.
 */
public struct TabBarUIAction: View {
    @Binding private var currentView: TabPosition
    @Binding private var showModal: Bool
    private var modal: TabModal
    private let tabItemsProperties: [TabItemProperties]
    private let colors: Colors

    /**
     Creates a `TabBarUIAction` instance.
     
     - parameter currentTab: the current tab selected as `Binding` state object of type `TabPosition`.
     - parameter showModal: the show modal toggle as `Binding` state object of type `Bool`.
     - parameter colors: the colors of the tab bar. See `Colors`.
     - parameter content: the content of the tab bar expressed as 3 items: first tab, modal and second tab.
     */
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

    /**
     Creates a `TabBarUIAction` instance.
     
     - parameter currentTab: the current tab selected as `Binding` state object of type `TabPosition`.
     - parameter showModal: the show modal toggle as `Binding` state object of type `Bool`.
     - parameter colors: the colors of the tab bar. See `Colors`.
     - parameter content: the content of the tab bar expressed as 5 items: first tab, second tab, modal and third tab and forth tab.
     */
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

    /// The body of TabBArUIAction. It creates a view with the modal tab content.
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
