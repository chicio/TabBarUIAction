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
                NavigationLink(destination: TabBarWith3Elements()) {
                    Text("Tab bar with 3 items")
                }
                NavigationLink(destination: TabBarWith5Elements()) {
                    Text("Tab bar with 5 items")
                }
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
                TabScreen(tabItem: TabItemContent(systemImageName: "folder.badge.plus")) { Screen1() }
                TabModal { ScreenModal() }
                TabScreen(tabItem: TabItemContent(systemImageName: "gear")) { Screen2() }
            }
        }
    }
}

struct TabBarWith5Elements: View {
    var body: some View {
        VStack {
            TabBarUIAction(tabItemColor: Color(.black), tabItemSelectionColor: Color(.blue)) {
                TabScreen(tabItem: TabItemContent(systemImageName: "tray.fill")) { Screen1() }
                TabScreen(tabItem: TabItemContent(systemImageName: "gamecontroller.fill")) { Screen1() }
                TabModal { ScreenModal() }
                TabScreen(tabItem: TabItemContent(systemImageName: "dpad.fill")) { Screen2() }
                TabScreen(tabItem: TabItemContent(systemImageName: "l1.rectangle.roundedbottom.fill")) { Screen2() }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
