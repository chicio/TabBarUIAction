//
//  TabBarItem.swift
//  CustomTabBar
//
//  Created by Fabrizio Duroni on 06.03.20.
//

import SwiftUI

struct TabBarItem: View {
    @Binding var currentView: TabPosition
    let tabItem: TabItemProperties
    let tabItemColors: TabItemColors

    var body: some View {
        Group {
            VStack(spacing: 0) {
                tabItem.screen.tabItemContent
                    .background(
                        tabItemColors
                            .tabItemSelectionColor
                            .opacity(currentView == tabItem.position ? 0.2 : 0.0)
                            .accessibility(identifier: "TabBarItem\(tabItem.position.rawValue + 1)ButtonBackground")
                            .allowsHitTesting(true)
                    )
                    .foregroundColor(
                        currentView == tabItem.position
                            ? tabItemColors.tabItemSelectionColor
                            : tabItemColors.tabItemColor
                    )
                    .cornerRadius(6)
            }
            .onTapGesture { currentView = tabItem.position }
            .accessibilityElement(children: .contain)
            .accessibility(identifier: "TabBarItem\(tabItem.position.rawValue + 1)Button")
        }
        .accessibilityElement(children: .contain)
        .accessibility(identifier: "TabBarItem\(tabItem.position.rawValue + 1)Group")
    }
}

struct TabBarItem_Previews: PreviewProvider {
    static var previews: some View {
        TabBarItem(
            currentView: .constant(.tab1),
            tabItem: TabItemProperties(
                position: .tab1,
                screen: TabScreen(
                    tabItem: TabItemContent(systemImageName: "gear", text: "Tab item 1", font: Font.system(size: 12)),
                    content: { Text("Content")}
                )
            ),
            tabItemColors: TabItemColors(
                tabItemColor: Color(.blue),
                tabItemSelectionColor: Color(.black)
            )
        )
    }
}
