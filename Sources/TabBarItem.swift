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

    var body: some View {
        Group {
            VStack(spacing: 0) {
                self.tabItem.screen.tabItem
                    .background(Color(self.currentView == self.tabItem.position ? .blue : .white).opacity(0.2))
                    .foregroundColor(Color(self.currentView == self.tabItem.position ? .blue : .black))
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
                    tabItem: TabItemContent(systemImageName: "gear"),
                    content: { Text("Content")}
                )
            )
        )
    }
}
