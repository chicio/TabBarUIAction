//
//  ContentView.swift
//  CustomTabBar
//
//  Created by Fabrizio Duroni on 06.03.20.
//

import SwiftUI
import TabBarUIAction

struct MainView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: TabBarWith3Elements()) { Text("Tab bar with 3 items") }
                NavigationLink(destination: TabBarWith5Elements()) { Text("Tab bar with 5 items") }
            }
            .navigationTitle("TabBarUIAction Demo")
        }
        .background(Color.white)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct TabBarWith3Elements: View {
    var body: some View {
        VStack {
            TabBarUIAction(tabItemColor: Color(.black), tabItemSelectionColor: Color(.blue)) {
                TabScreen(tabItem: TabItemContent(systemImageName: "folder.badge.plus", text: "Tab item 1", font: Font.system(size: 16))) { Screen1() }
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
                    ScreenModal()
                }
                TabScreen(tabItem: TabItemContent(systemImageName: "gear", text: "Tab item 2", font: Font.system(size: 16))) { Screen2() }
            }
        }
    }
}

struct TabBarWith5Elements: View {
    var body: some View {
        VStack {
            TabBarUIAction(tabItemColor: Color(.black), tabItemSelectionColor: Color(.blue)) {
                TabScreen(
                    tabItem: TabItemContent(systemImageName: "tray.fill", text: "Tab item 1", font: Font.system(size: 12))
                ) { Screen1() }
                TabScreen(
                    tabItem: TabItemContent(systemImageName: "gamecontroller.fill", text: "Tab item 2", font: Font.system(size: 12))
                ) { Screen1() }
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
                    ScreenModal()
                }
                TabScreen(
                    tabItem: TabItemContent(systemImageName: "dpad.fill", text: "Tab item 3", font: Font.system(size: 12))
                ) { Screen2() }
                TabScreen(
                    tabItem: TabItemContent(systemImageName: "l1.rectangle.roundedbottom.fill", text: "Tab item 4", font: Font.system(size: 12))
                ) { Screen2() }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
