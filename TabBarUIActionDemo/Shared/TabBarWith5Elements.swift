//
//  TabBarWith5Elements.swift
//  TabBarUIActionDemo
//
//  Created by Fabrizio Duroni on 24/03/21.
//

import SwiftUI
import TabBarUIAction

struct TabBarWith5Elements: View {
    @State private var currentTab: TabPosition = .tab1
    @State private var showModal: Bool = false

    var body: some View {
        VStack {
            TabBarUIAction(
                currentTab: $currentTab,
                showModal: $showModal,
                colors: Colors(
                    tabBarBackgroundColor: Color(.systemGray5),
                    tabItemsColors: TabItemsColors(
                        tabItemColor: Color(.systemPurple),
                        tabItemSelectionColor: Color(.systemIndigo)
                    )
                )
            ) {
                TabScreen(
                    tabItem: TabItemContent(
                        systemImageName: "tray.fill",
                        text: "Tab Item 1",
                        font: Font.system(size: 12)
                    )
                ) { Screen(text: "Screen 1", color: Color(.systemRed)) }
                TabScreen(
                    tabItem: TabItemContent(
                        systemImageName: "gamecontroller.fill",
                        text: "Tab Item 2",
                        font: Font.system(size: 12)
                    )
                ) { Screen(text: "Screen 2", color: Color(.systemOrange)) }
                TabModal {
                    Image(systemName: "plus")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30, alignment: .center)
                        .foregroundColor(Color(.white))
                        .padding(10)
                        .background(Color(.systemRed))
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(.systemRed), lineWidth: 2))
                        .accessibility(identifier: "TabBarModalButton")
                } content: {
                    ScreenModal(showModal: $showModal)
                }
                TabScreen(
                    tabItem: TabItemContent(
                        systemImageName: "dpad.fill",
                        text: "Tab Item 3",
                        font: Font.system(size: 12)
                    )
                ) { Screen(text: "Screen 3", color: Color(.systemTeal)) }
                TabScreen(
                    tabItem: TabItemContent(
                        systemImageName: "l1.rectangle.roundedbottom.fill",
                        text: "Tab Item 4",
                        font: Font.system(size: 12)
                    )
                ) { Screen(text: "Screen 4", color: Color(.systemGreen)) }
            }
        }
        .accessibilityElement(children: .contain)
        .accessibility(identifier: "TabBarWith5Elements")
    }
}

struct TabBarWith5Elements_Previews: PreviewProvider {
    static var previews: some View {
        TabBarWith5Elements()
    }
}
