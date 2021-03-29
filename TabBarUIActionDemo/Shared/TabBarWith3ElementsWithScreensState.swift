//
//  TabBarWith3Elements.swift
//  TabBarUIActionDemo
//
//  Created by Fabrizio Duroni on 24/03/21.
//

import SwiftUI
import TabBarUIAction

struct TabBarWith3ElementsWithScreensState: View {
    @State private var currentTab: TabPosition = .tab1
    @State private var showModal: Bool = false
    @State private var text: String = ""
    @State private var text2: String = ""

    var body: some View {
        VStack(spacing: 0) {
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
                    ScreenForm(title: "Form 1", text: $text)
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
                } content: {
                    ScreenModal(showModal: $showModal)
                }
                TabScreen(
                    tabItem: TabItemContent(systemImageName: "gear", text: "Tab Item 2", font: Font.system(size: 16))
                ) {
                    ScreenForm(title: "Form 2", text: $text2)
                }
            }
        }
        .accessibilityElement(children: .contain)
        .accessibility(identifier: "TabBarWith3ElementsWithScreenState")
    }
}

struct TabBarWith3ElementsWithComplexContent_Previews: PreviewProvider {
    static var previews: some View {
        TabBarWith3ElementsWithScreensState()
    }
}
