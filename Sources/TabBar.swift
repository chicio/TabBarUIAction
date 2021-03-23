//
//  TabBar.swift
//  CustomTabBar
//
//  Created by Fabrizio Duroni on 06.03.20.
//

import SwiftUI

public struct TabBar<Modal: View>: View {
    @Binding public var currentView: Tab
    @State public var showModal: Bool = false
    private let tabs: [Tab]
    private let modal: () -> Modal

    public init(currentView: Binding<Tab>, tabs: [Tab], @ViewBuilder modal: @escaping () -> Modal) {
        self._currentView = currentView
        self.tabs = tabs
        self.modal = modal
    }

    public var body: some View {
        HStack {
            ForEach(self.tabs[0..<self.tabs.count/2], id: \.id) { tab in
                TabBarItem(currentView: self.$currentView, imageName: "list.bullet", paddingEdges: .leading, tab: tab)
            }
            ModalTabBarItem(radius: 55) { self.showModal.toggle() }
            ForEach(self.tabs[self.tabs.count/2..<self.tabs.count], id: \.id) { tab in
                TabBarItem(currentView: self.$currentView, imageName: "gear", paddingEdges: .leading, tab: tab)
            }

            Spacer()
        }
        .frame(minHeight: 70)
        .sheet(isPresented: self.$showModal) { self.modal() }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(currentView: .constant(.tab1), tabs: [.tab1, .tab2]) {
            Text("Test")
        }
    }
}
