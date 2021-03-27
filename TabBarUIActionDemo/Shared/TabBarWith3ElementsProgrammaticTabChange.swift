//
//  TabBarWith3ElementsProgrammaticTabChange.swift
//  TabBarUIActionDemo
//
//  Created by Fabrizio Duroni on 26/03/21.
//

import SwiftUI
import TabBarUIAction

struct TabBarWith3ElementsWithProgrammaticTabChange: View {
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
                    tabBarColor: Color(.white),
                    tabItemColor: Color(.black),
                    tabItemSelectionColor: Color(.blue)
                )
            ) {
                TabScreen(
                    tabItem: TabItemContent(
                        systemImageName: "folder.badge.plus",
                        text: "Tab item 1",
                        font: Font.system(size: 16)
                    )
                ) {
                    Screen(text: "Screen 1", color: Color(.systemBlue)) {
                        Button("Go to tab 2") {
                            self.currentTab = .tab2
                        }
                        .accessibility(identifier: "GoToTab2Button")
                    }
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
                    tabItem: TabItemContent(systemImageName: "gear", text: "Tab item 2", font: Font.system(size: 16))
                ) {
                    Screen(text: "Screen 2", color: Color(.systemRed)) {
                        Button("Go to tab 1") {
                            self.currentTab = .tab1
                        }
                        .accessibility(identifier: "GoToTab1Button")
                    }
                }
            }
        }
        .accessibilityElement(children: .contain)
        .accessibility(identifier: "TabBarWith3ElementsWithProgrammaticTabChange")
    }
}

struct TabBarWith3ElementsWithProgrammaticTabChange_Previews: PreviewProvider {
    static var previews: some View {
        TabBarWith3ElementsWithProgrammaticTabChange()
    }
}
