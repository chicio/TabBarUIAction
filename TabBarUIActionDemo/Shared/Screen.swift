//
//  Screen2.swift
//  CustomTabBar
//
//  Created by Fabrizio Duroni on 06.03.20.
//

import SwiftUI

struct Screen: View, Equatable {
    let text: String
    let color: Color

    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Text(self.text)
                    .font(.system(size: 20))
                    .bold()
                Spacer()
            }
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .background(self.color.opacity(0.2))
        .navigationTitle(self.text)
    }
}

struct Screen2_Previews: PreviewProvider {
    static var previews: some View {
        Screen(text: "Screen", color: Color(.systemRed))
    }
}
