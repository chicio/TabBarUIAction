//
//  TabBarWith3Elements.swift
//  TabBarUIActionDemo
//
//  Created by Fabrizio Duroni on 25/03/21.
//

import SwiftUI
import TabBarUIAction

struct TabBarWith3Elements: View {
    @State private var currentTab: TabPosition = .tab1
    @State private var showModal: Bool = false

    var body: some View {
        VStack {
            TabBarUIAction(
                currentTab: $currentTab,
                showModal: $showModal,
                colors: Colors(
                    tabBarBackgroundColor: Color(.white),
                    tabItemsColors: TabItemsColors(
                        tabItemColor: Color(.black),
                        tabItemSelectionColor: Color(.blue)
                    )
                )
            ) {
                TabScreen(
                    tabItem: TabItemContent(
                        systemImageName: "folder.badge.plus",
                        text: "Tab Item 1",
                        font: Font.system(size: 16)
                    )
                ) {
                    Screen(text: "Screen 1", color: Color(.systemBlue))
                }
                TabModal {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 55, height: 55, alignment: .center)
                        .foregroundColor(Color(.systemBlue))
                        .background(Color(.white))
                        .cornerRadius(55/2)
                        .overlay(RoundedRectangle(cornerRadius: 55/2).stroke(Color(.blue), lineWidth: 2))
                        .accessibility(identifier: "TabBarModalButton")
                } content: {
                    ScreenModal(showModal: $showModal)
                }
                TabScreen(
                    tabItem: TabItemContent(systemImageName: "gear", text: "Tab Item 2", font: Font.system(size: 16))
                ) {
                    Screen(text: "Screen 2", color: Color(.systemRed))
                }
            }
        }
        .accessibilityElement(children: .contain)
        .accessibility(identifier: "TabBarWith3Elements")
    }
}

struct TabBarWith3Elements_Previews: PreviewProvider {
    static var previews: some View {
        TabBarWith3Elements()
    }
}
