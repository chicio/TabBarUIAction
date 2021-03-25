//
//  TabBarWith3Elements.swift
//  TabBarUIActionDemo
//
//  Created by Fabrizio Duroni on 24/03/21.
//

import SwiftUI
import TabBarUIAction

struct TabBarWith3ElementsWithComplexContent: View {
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
                        Form {
                            Label("Field example", systemImage: "pencil")
                            TextField("field", text: $text)
                                .background(Color(.white))
                                .multilineTextAlignment(.center)
                        }
                        .padding(0)
                        .background(Color.clear)
                        .navigationTitle("Form Screen 1")
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
                    Screen(text: "Modal", color: Color(.systemOrange))
                }
                TabScreen(
                    tabItem: TabItemContent(systemImageName: "gear", text: "Tab item 2", font: Font.system(size: 16))
                ) {
                    Form {
                        Label("Field example", systemImage: "pencil")
                        TextField("field", text: $text2)
                            .background(Color(.white))
                            .multilineTextAlignment(.center)
                    }
                    .padding(0)
                    .background(Color.clear)
                    .navigationTitle("Form Screen 2")
                }
            }
        }
    }
}

struct TabBarWith3ElementsWithComplexContent_Previews: PreviewProvider {
    static var previews: some View {
        TabBarWith3ElementsWithComplexContent()
    }
}
