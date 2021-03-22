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
    private let modal: () -> Modal

    public init(currentView: Binding<Tab>, @ViewBuilder modal: @escaping () -> Modal) {
        self._currentView = currentView
        self.modal = modal
    }

    public var body: some View {
        HStack {
            TabBarItem(currentView: self.$currentView, imageName: "list.bullet", paddingEdges: .leading, tab: .tab1)
            Spacer()
            ModalTabBarItem(radius: 55) { self.showModal.toggle() }
            Spacer()
            TabBarItem(currentView: self.$currentView, imageName: "gear", paddingEdges: .trailing, tab: .tab2)
        }
        .frame(minHeight: 70)
        .sheet(isPresented: self.$showModal) { self.modal() }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(currentView: .constant(.tab1)) {
            Text("Test")
        }
    }
}
