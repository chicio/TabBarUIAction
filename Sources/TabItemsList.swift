//
//  TabItemsList.swift
//  TabBarUIAction
//
//  Created by Fabrizio Duroni on 24/03/21.
//

import SwiftUI

struct TabItemsList: View {
    @Binding var currentView: TabPosition
    let tabItems: [TabItemProperties]
    let tabItemColors: TabItemColors

    var body: some View {
        ForEach(tabItems) { tabItem in
            TabBarItem(
                currentView: self.$currentView,
                tabItem: tabItem,
                tabItemColors: TabItemColors(
                    tabItemColor: self.tabItemColors.tabItemColor,
                    tabItemSelectionColor: self.tabItemColors.tabItemSelectionColor
                )
            )
            Spacer()
        }
    }
}

struct TabItemsList_Previews: PreviewProvider {
    static var previews: some View {
        TabItemsList(
            currentView: .constant(.tab1),
            tabItems: [
                TabItemProperties(
                    position: .tab1,
                    screen: TabScreen(
                        tabItem: TabItemContent(
                            systemImageName: "gear",
                            text: "Tab item 1",
                            font: Font.system(size: 12)
                        )
                    ) { Text("aaa") }
            )],
            tabItemColors: TabItemColors(
                tabItemColor: Color(.blue),
                tabItemSelectionColor: Color(.blue)
            )
        )
    }
}
