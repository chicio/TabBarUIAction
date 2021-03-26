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
                    Text("TabBar 3 items")
                }
                .accessibility(identifier: "TabBar3items")
                NavigationLink(destination: TabBarWith5Elements()) {
                    Text("TabBar 5 items")
                }
                NavigationLink(destination: TabBarWith3ElementsWithScreensState()) {
                    Text("TabBar 3 items + screens state")
                }
                NavigationLink(destination: TabBarWith5ElementsWithNavigation()) {
                    Text("TabBar 5 items + navigation to detail")
                }
                NavigationLink(destination: TabBarWith3ElementsWithProgrammaticTabChange()) {
                    Text("TabBar 5 items + programmatic tab change")
                }
            }
            .navigationTitle("TabBarUIAction Demo")
        }
        .accessibility(identifier: "TabBarUIActionDemoAppNavigationView")
        .background(Color.white)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
