//
//  Screen1.swift
//  CustomTabBar
//
//  Created by Fabrizio Duroni on 06.03.20.
//

import SwiftUI

struct Screen1: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Text("Screen 1")
                    .font(.system(size: 20))
                    .bold()
                Spacer()
            }
            HStack {
                NavigationLink(destination: ScreenDetail()) { Text("Show detail") }
            }
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .background(Color(.yellow).opacity(0.2))
        .navigationBarTitle("Screen 1")
    }
}

struct Screen1_Previews: PreviewProvider {
    static var previews: some View {
        Screen1()
    }
}
