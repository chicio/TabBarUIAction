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
    @State private var text: String = ""
    
    var body: some View {
        VStack {
            TabBarUIAction(
                currentTab: $currentTab,
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
                    Screen(text: "Screen 1", color: Color(.systemYellow))  {
                        VStack(alignment: .leading, spacing: 10) {
                            Form {
                                Label("Field example", systemImage: "pencil")
                                TextField("aaaa", text: $text)
                                    .background(Color(.white))
                                    .multilineTextAlignment(.center)
                            }
                        }
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
                    Screen(text: "Modal", color: Color(.systemOrange))
                }
                TabScreen(
                    tabItem: TabItemContent(systemImageName: "gear", text: "Tab item 2", font: Font.system(size: 16))
                ) {
                    Screen(text: "Screen 2", color: Color(.systemRed))
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
