//
//  TabBar.swift
//  CustomTabBar
//
//  Created by Fabrizio Duroni on 06.03.20.
//

import SwiftUI

public struct TabBar: View {
    @Binding public var currentView: Tab
    @Binding public var showModal: Bool

    public init(currentView: Binding<Tab>, showModal: Binding<Bool>) {
           self._currentView = currentView
           self._showModal = showModal
       }

    public var body: some View {
        HStack {
            TabBarItem(currentView: self.$currentView, imageName: "list.bullet", paddingEdges: .leading, tab: .tab1)
            Spacer()
            ShowModalTabBarItem(radius: 55) { self.showModal.toggle() }
            Spacer()
            TabBarItem(currentView: self.$currentView, imageName: "gear", paddingEdges: .trailing, tab: .tab2)
        }
        .frame(minHeight: 70)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(currentView: .constant(.tab1), showModal: .constant(false))
    }
}
