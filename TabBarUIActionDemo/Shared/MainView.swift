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
                    Text("3 options tab bar")
                }
                NavigationLink(destination: TabBarWith5Elements()) {
                    Text("5 options tab bar")
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
            TabBarUIAction {
                TabScreen { Screen1() }
                TabModal { ScreenModal() }
                TabScreen { Screen2() }
            }
        }
    }
}

struct TabBarWith5Elements: View {
    var body: some View {
        VStack {
            TabBarUIAction {
                TabScreen { Screen1() }
                TabScreen { Screen1() }
                TabModal { ScreenModal() }
                TabScreen { Screen2() }
                TabScreen { Screen2() }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
