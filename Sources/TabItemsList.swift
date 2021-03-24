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
    let tabItemColor: Color
    let tabItemSelectionColor: Color

    var body: some View {
        ForEach(tabItems) { tabItem in
            TabBarItem(
                currentView: self.$currentView,
                tabItem: tabItem,
                tabItemColor: self.tabItemColor,
                tabItemSelectionColor: self.tabItemSelectionColor
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
            tabItemColor: Color(.blue),
            tabItemSelectionColor: Color(.blue)
        )
    }
}
