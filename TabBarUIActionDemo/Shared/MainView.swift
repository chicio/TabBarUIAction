//
//  ContentView.swift
//  CustomTabBar
//
//  Created by Fabrizio Duroni on 06.03.20.
//

import SwiftUI
import TabBarUIAction

struct MainView: View {
    @State private var showModal: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                TabBarUIAction(showModal: self.$showModal) { currentView in
                    if currentView == .tab1 {
                        Screen1()
                    } else {
                        Screen2()
                    }
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
        .background(Color(.white))
        .navigationViewStyle(StackNavigationViewStyle())
        .sheet(isPresented: self.$showModal) { ScreenModal() }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
