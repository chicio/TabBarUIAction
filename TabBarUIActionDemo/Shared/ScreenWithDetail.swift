//
//  ScreenWithDetail.swift
//  TabBarUIActionDemo
//
//  Created by Fabrizio Duroni on 06.03.20.
//

import SwiftUI

struct ScreenWithDetail: View, Equatable {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Text("Screen with detail")
                    .font(.system(size: 20))
                    .bold()
                    .accessibility(identifier: "ScreenDetailContent")
                Spacer()
            }
            HStack {
                NavigationLink(destination: Screen(text: "Detail Screen", color: Color(.systemGreen))) {
                    Text("Show detail")
                }
                .accessibility(identifier: "GoToDetailButton")
            }
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .background(Color(.yellow).opacity(0.2))
        .navigationTitle("Screen with detail")
        .accessibilityElement(children: .contain)
        .accessibility(identifier: "ScreenWithDetail")
    }
}

struct Screen1_Previews: PreviewProvider {
    static var previews: some View {
        ScreenWithDetail()
    }
}
