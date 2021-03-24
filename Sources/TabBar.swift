//
//  TabBar.swift
//  CustomTabBar
//
//  Created by Fabrizio Duroni on 06.03.20.
//

import SwiftUI

public struct TabBar: View {
    @Binding public var currentView: TabPosition
    @State public var showModal: Bool = false
    private let tabItems: [TabItem]
    private let modal: TabModal
    private let tabItemColor: Color
    private let tabItemSelectionColor: Color

    public init(
        tabItemColor: Color,
        tabItemSelectionColor: Color,
        currentView: Binding<TabPosition>,
        tabItems: [TabItem],
        modal: TabModal
    ) {
        self._currentView = currentView
        self.tabItems = tabItems
        self.modal = modal
        self.tabItemColor = tabItemColor
        self.tabItemSelectionColor = tabItemSelectionColor
    }

    public var body: some View {
        HStack(alignment: .center, spacing: 0) {
            Spacer()
            ForEach(self.tabItems[0..<self.tabItems.count/2], id: \.id) { tabItem in
                TabBarItem(
                    currentView: self.$currentView,
                    tabItem: tabItem,
                    tabItemColor: self.tabItemColor,
                    tabItemSelectionColor: self.tabItemSelectionColor
                )
                Spacer()
            }
            ModalTabBarItem(modalTabBarItemContent: self.modal.modalTabBarItemContent) { self.showModal.toggle() }
            Spacer()
            ForEach(self.tabItems[self.tabItems.count/2..<self.tabItems.count], id: \.id) { tabItem in
                TabBarItem(
                    currentView: self.$currentView,
                    tabItem: tabItem,
                    tabItemColor: self.tabItemColor,
                    tabItemSelectionColor: self.tabItemSelectionColor
                )
                Spacer()
            }
        }
        .frame(minHeight: 70)
        .sheet(isPresented: self.$showModal) { self.modal }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(
            tabItemColor: Color(.blue),
            tabItemSelectionColor: Color(.black),
            currentView: .constant(.tab1),
            tabItems: [
                TabItem(
                    position: .tab1,
                    screen: TabScreen(
                        tabItem: TabItemContent(
                            systemImageName: "gear",
                            text: "Tab item 1",
                            font: Font.system(size: 12)
                        )
                    ) { Text("Screen1") }),
                TabItem(
                    position: .tab2,
                    screen: TabScreen(
                        tabItem: TabItemContent(
                            systemImageName: "gear",
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
