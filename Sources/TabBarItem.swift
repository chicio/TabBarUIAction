//
//  TabBarItem.swift
//  CustomTabBar
//
//  Created by Fabrizio Duroni on 06.03.20.
//

import SwiftUI

struct TabBarItem: View {
    @Binding var currentView: TabPosition
    let tabItem: TabItem
    let tabItemColor: Color
    let tabItemSelectionColor: Color

    var body: some View {
        Group {
            VStack(spacing: 0) {
                self.tabItem.screen.tabItemContent
                    .background(tabItemSelectionColor.opacity(self.currentView == self.tabItem.position ? 0.2 : 0.0))
                    .foregroundColor(self.currentView == self.tabItem.position ? self.tabItemSelectionColor : self.tabItemColor)
                    .cornerRadius(6)
            }
            .onTapGesture { self.currentView = self.tabItem.position }
        }
    }
}

struct TabBarItem_Previews: PreviewProvider {
    static var previews: some View {
        TabBarItem(
            currentView: .constant(.tab1),
            tabItem: TabItem(
                position: .tab1,
                screen: TabScreen(
                    tabItem: TabItemContent(systemImageName: "gear", text: "Tab item 1", font: Font.system(size: 12)),
                    content: { Text("Content")}
                )
            ),
            tabItemColor: Color(.blue),
            tabItemSelectionColor: Color(.black)
        )
    }
}
