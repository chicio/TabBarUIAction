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
    private let tabItemColor: Color
    private let tabItemSelectionColor: Color

    public init(
        tabItemColor: Color,
        tabItemSelectionColor: Color,
        @ViewBuilder content: () -> TupleView<(TabScreen, TabModal, TabScreen)>
    ) {
        let views = content().value
        self.modal = views.1
        self.tabItems = [
            TabItem(position: .tab1, screen: views.0),
            TabItem(position: .tab2, screen: views.2)
        ]
        self.tabItemColor = tabItemColor
        self.tabItemSelectionColor = tabItemSelectionColor
    }

    public init(
        tabItemColor: Color,
        tabItemSelectionColor: Color,
        @ViewBuilder content: () -> TupleView<(TabScreen, TabScreen, TabModal, TabScreen, TabScreen)>
    ) {
        let views = content().value
        self.modal = views.2
        self.tabItems = [
            TabItem(position: .tab1, screen: views.0),
            TabItem(position: .tab2, screen: views.1),
            TabItem(position: .tab3, screen: views.3),
            TabItem(position: .tab4, screen: views.4)
        ]
        self.tabItemColor = tabItemColor
        self.tabItemSelectionColor = tabItemSelectionColor
    }

    public var body: some View {
        VStack {
            self.tabItems[currentView.rawValue].screen
            TabBar(
                tabItemColor: tabItemColor,
                tabItemSelectionColor: tabItemSelectionColor,
                currentView: self.$currentView,
                tabItems: self.tabItems,
                modal: self.modal
            )
        }
        .ignoresSafeArea(.keyboard)
    }
}

struct TabBarUIAction_Previews: PreviewProvider {
    static var previews: some View {
        TabBarUIAction(tabItemColor: Color(.black), tabItemSelectionColor: Color(.blue)) {
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
