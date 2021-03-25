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
                NavigationLink(destination: TabBarWith3ElementsWithNavigation()) {
                    Text("Tab bar 3 items + with navigation to detail")
                }
                NavigationLink(destination: TabBarWith3ElementsWithComplexContent()) {
                    Text("Tab bar 3 items + complex content")
                }
                NavigationLink(destination: TabBarWith5Elements()) {
                    Text("Tab bar 5 items + custom tabbar colors")
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
