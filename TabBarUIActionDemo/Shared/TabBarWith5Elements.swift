//
//  TabBarWith5Elements.swift
//  TabBarUIActionDemo
//
//  Created by Fabrizio Duroni on 24/03/21.
//

import SwiftUI
import TabBarUIAction

struct TabBarWith5Elements: View {
    var body: some View {
        VStack {
            TabBarUIAction(
                colors: Colors(
                    tabBarColor: Color(.systemGray5),
                    tabItemColor: Color(.black),
                    tabItemSelectionColor: Color(.systemIndigo)
                )
            ) {
                TabScreen(
                    tabItem: TabItemContent(
                        systemImageName: "tray.fill",
                        text: "Tab item 1",
                        font: Font.system(size: 12)
                    )
                ) { Screen(text: "Screen 1", color: Color(.systemRed)) }
                TabScreen(
                    tabItem: TabItemContent(
                        systemImageName: "gamecontroller.fill",
                        text: "Tab item 2",
                        font: Font.system(size: 12)
                    )
                ) { ScreenWithDetail() }
                TabModal {
                    Image(systemName: "plus")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30, alignment: .center)
                        .foregroundColor(Color(.white))
                        .padding(10)
                        .background(Color(.black))
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(.black), lineWidth: 2))
                } content: {
                    Screen(text: "Modal", color: Color(.systemOrange))
                }
                TabScreen(
                    tabItem: TabItemContent(
                        systemImageName: "dpad.fill",
                        text: "Tab item 3",
                        font: Font.system(size: 12)
                    )
                ) { Screen(text: "Screen 3", color: Color(.systemTeal)) }
                TabScreen(
                    tabItem: TabItemContent(
                        systemImageName: "l1.rectangle.roundedbottom.fill",
                        text: "Tab item 4",
                        font: Font.system(size: 12)
                    )
                ) { Screen(text: "Screen 4", color: Color(.systemGreen)) }
            }
        }
    }
}

struct TabBarWith5Elements_Previews: PreviewProvider {
    static var previews: some View {
        TabBarWith5Elements()
    }
}
