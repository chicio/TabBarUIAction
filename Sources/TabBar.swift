//
//  TabBar.swift
//  CustomTabBar
//
//  Created by Fabrizio Duroni on 06.03.20.
//

import SwiftUI

struct TabBar: View {
    @Binding var currentView: TabPosition
    @State public var showModal: Bool = false
    private let tabItems: [TabItemProperties]
    private let modal: TabModal
    private let tabItemColors: TabItemColors

    init(
        tabItemColors: TabItemColors,
        currentView: Binding<TabPosition>,
        tabItems: [TabItemProperties],
        modal: TabModal
    ) {
        self._currentView = currentView
        self.tabItemColors = tabItemColors
        self.tabItems = tabItems
        self.modal = modal
    }

    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            Spacer()
            TabItemsList(
                currentView: self.$currentView,
                tabItems: Array(self.tabItems[0..<self.tabItems.count/2]),
                tabItemColors: self.tabItemColors
            )
            TabBarModalItem(modalTabBarItemContent: self.modal.modalTabBarItemContent) { self.showModal.toggle() }
            Spacer()
            TabItemsList(
                currentView: self.$currentView,
                tabItems: Array(self.tabItems[self.tabItems.count/2..<self.tabItems.count]),
                tabItemColors: self.tabItemColors
            )
        }
        .frame(minHeight: 70)
        .sheet(isPresented: self.$showModal) { self.modal }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(
            tabItemColors: TabItemColors(tabItemColor: Color(.blue), tabItemSelectionColor: Color(.black)),
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
