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
                colors.tabBarColor
                    .ignoresSafeArea()
                    .accessibility(identifier: "TabBarUIActionBackground")
            )
        }
        .ignoresSafeArea(.keyboard)
        .accessibilityElement(children: .contain)
        .accessibility(identifier: "TabBarUIAction")
    }
}

struct TabBarUIAction_Previews: PreviewProvider {
    static var previews: some View {
        TabBarUIAction(
            currentTab: .constant(.tab2),
            showModal: .constant(false),
            colors: Colors(
                tabBarColor: Color(.white),
                tabItemColor: Color(.black),
                tabItemSelectionColor: Color(.blue)
            )
        ) {
            TabScreen(
                tabItem: TabItemContent(systemImageName: "gear", text: "Tab item 1", font: Font.system(size: 12))
            ) { Text("aaa") }
            TabModal {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 55, height: 55, alignment: .center)
                    .foregroundColor(Color(.systemBlue))
                    .background(Color(.white))
                    .cornerRadius(55/2)
                    .overlay(RoundedRectangle(cornerRadius: 55/2).stroke(Color(.blue), lineWidth: 2))
            } content: {
                Text("Modal")
            }
            TabScreen(
                tabItem: TabItemContent(systemImageName: "gear", text: "Tab item 2", font: Font.system(size: 12))
            ) { Text("aaa") }
        }
    }
}
