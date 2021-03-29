//
//  TabItemsList_Previews.swift
//  TabBarUIAction
//
//  Created by Fabrizio Duroni on 29/03/21.
//

import SwiftUI

#if !TEST
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
#endif
