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
