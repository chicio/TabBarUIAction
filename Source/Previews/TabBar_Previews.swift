//
//  TabBar_Previews.swift
//  TabBarUIAction iOS
//
//  Created by Fabrizio Duroni on 29/03/21.
//

import SwiftUI

#if !TEST
struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(
            currentView: .constant(.tab1),
            showModal: .constant(false),
            tabItemColors: TabItemColors(tabItemColor: Color(.blue), tabItemSelectionColor: Color(.black)),
            tabItems: [
                TabItemProperties(
                    position: .tab1,
                    screen: TabScreen(
                        tabItem: TabItemContent(
                            systemImageName: "gear",
                            text: "Tab item 1",
                            font: Font.system(size: 12)
                        )
                    ) { Text("Screen1") }),
                TabItemProperties(
                    position: .tab2,
                    screen: TabScreen(
                        tabItem: TabItemContent(
                            systemImageName: "pencil",
                            text: "Tab item 2",
                            font: Font.system(size: 12)
                        )
                    ) { Text("Screen2") })
            ],
            modal: TabModal(modalTabBarItemContent: {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 55, height: 55, alignment: .center)
                    .foregroundColor(Color(.systemBlue))
                    .background(Color(.white))
                    .cornerRadius(55/2)
                    .overlay(RoundedRectangle(cornerRadius: 55/2).stroke(Color(.blue), lineWidth: 2))
            }, content: {
                Text("Modal")
            })
        )
    }
}
#endif
