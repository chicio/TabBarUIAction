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

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
