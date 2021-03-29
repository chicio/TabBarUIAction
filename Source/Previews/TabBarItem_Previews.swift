//
//  TabBarItem_Previews.swift
//  TabBarUIAction
//
//  Created by Fabrizio Duroni on 29/03/21.
//

import SwiftUI

#if !TEST
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
            tabItemColors: TabItemsColors(
                tabItemColor: Color(.blue),
                tabItemSelectionColor: Color(.black)
            )
        )
    }
}
#endif
