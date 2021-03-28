//
//  TabItemsList.swift
//  TabBarUIAction
//
//  Created by Fabrizio Duroni on 24/03/21.
//

import SwiftUI

struct TabItemsList: View {
    @Binding var currentView: TabPosition
    let tabItemsProperties: [TabItemProperties]
    let tabItemColors: TabItemColors

    var body: some View {
        ForEach(tabItemsProperties) { tabItem in
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
            tabItemsProperties: [
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
