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
                    Text("Tab bar 3 items")
                }
                NavigationLink(destination: TabBarWith5Elements()) {
                    Text("Tab bar 5 items")
                }
                NavigationLink(destination: TabBarWith3ElementsWithScreensState()) {
                    Text("Tab bar 3 items + screens state")
                }
                NavigationLink(destination: TabBarWith5ElementsWithNavigation()) {
                    Text("Tab bar 5 items + with navigation to detail")
                }
            }
            .navigationTitle("TabBarUIAction Demo")
        }
        .background(Color.white)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
