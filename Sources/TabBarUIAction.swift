//
//  TabBarUIAction.swift
//  TabBarUIAction
//
//  Created by Fabrizio Duroni on 21/03/21.
//

import SwiftUI

public struct TabBarUIAction: View {
    @State private var currentView: TabPosition = .tab1
    private var modal: TabModal
    private let tabItemsProperties: [TabItemProperties]
    private let tabBarColor: Color
    private let tabItemColor: Color
    private let tabItemSelectionColor: Color

    public init(
        tabBarColor: Color,
        tabItemColor: Color,
        tabItemSelectionColor: Color,
        @ViewBuilder content: () -> TupleView<(TabScreen, TabModal, TabScreen)>
    ) {
        let views = content().value
        self.modal = views.1
        self.tabItemsProperties = [
            TabItemProperties(position: .tab1, screen: views.0),
            TabItemProperties(position: .tab2, screen: views.2)
        ]
        self.tabBarColor = tabBarColor
        self.tabItemColor = tabItemColor
        self.tabItemSelectionColor = tabItemSelectionColor
    }

    public init(
        tabBarColor: Color,
        tabItemColor: Color,
        tabItemSelectionColor: Color,
        @ViewBuilder content: () -> TupleView<(TabScreen, TabScreen, TabModal, TabScreen, TabScreen)>
    ) {
        let views = content().value
        self.modal = views.2
        self.tabItemsProperties = [
            TabItemProperties(position: .tab1, screen: views.0),
            TabItemProperties(position: .tab2, screen: views.1),
            TabItemProperties(position: .tab3, screen: views.3),
            TabItemProperties(position: .tab4, screen: views.4)
        ]
        self.tabBarColor = tabBarColor
        self.tabItemColor = tabItemColor
        self.tabItemSelectionColor = tabItemSelectionColor
    }

    public var body: some View {
        VStack {
            self.tabItemsProperties[currentView.rawValue].screen
            TabBar(
                tabItemColor: tabItemColor,
                tabItemSelectionColor: tabItemSelectionColor,
                currentView: self.$currentView,
                tabItems: self.tabItemsProperties,
                modal: self.modal
            ).background(self.tabBarColor.ignoresSafeArea())
        }
        .ignoresSafeArea(.keyboard)
    }
}

struct TabBarUIAction_Previews: PreviewProvider {
    static var previews: some View {
        TabBarUIAction(tabBarColor: Color(.white), tabItemColor: Color(.black), tabItemSelectionColor: Color(.blue)) {
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
