//
//  Screen2.swift
//  CustomTabBar
//
//  Created by Fabrizio Duroni on 06.03.20.
//

import SwiftUI

struct Screen2: View {
    @State public var text: String = ""

    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Text("Screen 2")
                    .font(.system(size: 20))
                    .bold()
                TextField("test", text: self.$text)
                Spacer()
            }
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .background(Color(.purple).opacity(0.2))
        .navigationTitle("Screen 2")
    }
}

struct Screen2_Previews: PreviewProvider {
    static var previews: some View {
        Screen2()
    }
}
