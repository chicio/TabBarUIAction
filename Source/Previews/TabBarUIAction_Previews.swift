//
//  TabBarUIAction_Previews.swift
//  TabBarUIAction
//
//  Created by Fabrizio Duroni on 29/03/21.
//

import SwiftUI

#if !TEST
struct TabBarUIAction_Previews: PreviewProvider {
    static var previews: some View {
        TabBarUIAction(
            currentTab: .constant(.tab2),
            showModal: .constant(false),
            colors: Colors(
                tabBarColor: Color(.white),
                tabItemColor: Color(.black),
                tabItemSelectionColor: Color(.blue)
            )
        ) {
            TabScreen(
                tabItem: TabItemContent(systemImageName: "gear", text: "Tab item 1", font: Font.system(size: 12))
            ) { Text("Test") }
            TabModal {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 55, height: 55, alignment: .center)
                    .foregroundColor(Color(.systemBlue))
                    .background(Color(.white))
                    .cornerRadius(55/2)
                    .overlay(RoundedRectangle(cornerRadius: 55/2).stroke(Color(.blue), lineWidth: 2))
            } content: {
                Text("Modal")
            }
            TabScreen(
                tabItem: TabItemContent(systemImageName: "gear", text: "Tab item 2", font: Font.system(size: 12))
            ) { Text("Test") }
        }
    }
}
#endif
