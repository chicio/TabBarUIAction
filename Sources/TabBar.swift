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
    private let numberOfTabs: Int
    private let modal: () -> Modal

    public init(currentView: Binding<Tab>, numberOfTabs: Int, @ViewBuilder modal: @escaping () -> Modal) {
        self._currentView = currentView
        self.numberOfTabs = numberOfTabs
        self.modal = modal
    }

    public var body: some View {
        HStack {
            if numberOfTabs == 2 {
                TabBarItem(currentView: self.$currentView, imageName: "list.bullet", paddingEdges: .leading, tab: .tab1)
                ModalTabBarItem(radius: 55) { self.showModal.toggle() }
                TabBarItem(currentView: self.$currentView, imageName: "gear", paddingEdges: .trailing, tab: .tab2)
                Spacer()
            } else {
                TabBarItem(currentView: self.$currentView, imageName: "list.bullet", paddingEdges: .leading, tab: .tab1)
                TabBarItem(currentView: self.$currentView, imageName: "list.bullet", paddingEdges: .leading, tab: .tab2)
                ModalTabBarItem(radius: 55) { self.showModal.toggle() }
                TabBarItem(currentView: self.$currentView, imageName: "gear", paddingEdges: .trailing, tab: .tab3)
                TabBarItem(currentView: self.$currentView, imageName: "gear", paddingEdges: .trailing, tab: .tab4)
                Spacer()
            }
        }
        .frame(minHeight: 70)
        .sheet(isPresented: self.$showModal) { self.modal() }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(currentView: .constant(.tab1), numberOfTabs: 3) {
            Text("Test")
        }
    }
}
