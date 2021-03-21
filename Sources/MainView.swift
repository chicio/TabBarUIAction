//
//  ContentView.swift
//  CustomTabBar
//
//  Created by Fabrizio Duroni on 06.03.20.
//

import SwiftUI

struct MainView: View {
    @State private var currentView: Tab = .Tab1
    @State private var showModal: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                CurrentScreen(currentView: self.$currentView)
                TabBar(currentView: self.$currentView, showModal: self.$showModal)
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
