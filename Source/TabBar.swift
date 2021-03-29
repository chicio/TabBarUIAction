//
//  TabBar.swift
//  CustomTabBar
//
//  Created by Fabrizio Duroni on 06.03.20.
//

import SwiftUI

struct TabBar: View {
    @Binding private var currentView: TabPosition
    @Binding private var showModal: Bool
    private let tabItemsProperties: [TabItemProperties]
    private let modal: TabModal
    private let tabItemColors: TabItemColors

    init(
        currentView: Binding<TabPosition>,
        showModal: Binding<Bool>,
        tabItemColors: TabItemColors,
        tabItems: [TabItemProperties],
        modal: TabModal
    ) {
        self._currentView = currentView
        self._showModal = showModal
        self.tabItemColors = tabItemColors
        self.tabItemsProperties = tabItems
        self.modal = modal
    }

    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            Spacer()
            TabItemsList(
                currentView: $currentView,
                tabItemsProperties: firstHalfTabItems(),
                tabItemColors: tabItemColors
            )
            TabBarModalItem(modalTabBarItemContent: modal.modalTabBarItemContent) { showModal.toggle() }
            Spacer()
            TabItemsList(
                currentView: $currentView,
                tabItemsProperties: secondHalfTabItems(),
                tabItemColors: tabItemColors
            )
        }
        .frame(minHeight: 70)
        .sheet(isPresented: $showModal) { modal }
        .accessibilityElement(children: .contain)
        .accessibility(identifier: "TabBar")
    }

    func firstHalfTabItems() -> [TabItemProperties] {
        return Array(tabItemsProperties[0..<tabItemsProperties.count/2])
    }

    func secondHalfTabItems() -> [TabItemProperties] {
        return Array(tabItemsProperties[tabItemsProperties.count/2..<tabItemsProperties.count])
    }
}
