//
//  TabBar.swift
//  CustomTabBar
//
//  Created by Fabrizio Duroni on 06.03.20.
//

import SwiftUI

struct TabBar: View {
    @Binding private var currentView: TabPosition
    @Binding private var showModal: Bool
    private let tabItemsProperties: [TabItemProperties]
    private let modal: TabModal
    private let tabItemColors: TabItemColors

    init(
        currentView: Binding<TabPosition>,
        showModal: Binding<Bool>,
        tabItemColors: TabItemColors,
        tabItems: [TabItemProperties],
        modal: TabModal
    ) {
        self._currentView = currentView
        self._showModal = showModal
        self.tabItemColors = tabItemColors
        self.tabItemsProperties = tabItems
        self.modal = modal
    }

    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            Spacer()
            TabItemsList(
                currentView: $currentView,
                tabItemsProperties: firstHalfTabItems(),
                tabItemColors: tabItemColors
            )
            TabBarModalItem(modalTabBarItemContent: modal.modalTabBarItemContent) { showModal.toggle() }
            Spacer()
            TabItemsList(
                currentView: $currentView,
                tabItemsProperties: secondHalfTabItems(),
                tabItemColors: tabItemColors
            )
        }
        .frame(minHeight: 70)
        .sheet(isPresented: $showModal) { modal }
    }

    func firstHalfTabItems() -> [TabItemProperties] {
        return Array(tabItemsProperties[0..<tabItemsProperties.count/2])
    }

    func secondHalfTabItems() -> [TabItemProperties] {
        return Array(tabItemsProperties[tabItemsProperties.count/2..<tabItemsProperties.count])
    }
}

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
