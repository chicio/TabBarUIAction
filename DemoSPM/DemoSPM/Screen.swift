//
//  Screen2.swift
//  CustomTabBar
//
//  Created by Fabrizio Duroni on 06.03.20.
//

import SwiftUI

struct Screen<Content: View>: View {
    let text: String
    let color: Color
    let content: () -> Content

    init(text: String, color: Color, @ViewBuilder content: @escaping () -> Content) {
        self.text = text
        self.color = color
        self.content = content
    }

    init(text: String, color: Color) where Content == EmptyView {
        self.init(text: text, color: color, content: { EmptyView() })
    }

    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            HStack(spacing: 0) {
                Spacer()
                VStack(spacing: 0) {
                    Spacer()
                    Text(self.text)
                        .font(.system(size: 20))
                        .bold()
                        .padding(10)
                        .accessibility(identifier: self.text.getAccessibilityIdentifier(suffix: "ScreenText"))
                    self.content()
                    Spacer()
                }
                .accessibilityElement(children: .contain)
                Spacer()
            }
            .accessibilityElement(children: .contain)
            Spacer()
        }
        .accessibilityElement(children: .contain)
        .accessibility(identifier: self.text.getAccessibilityIdentifier(suffix: ""))
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .background(self.color.opacity(0.2))
        .navigationTitle(self.text)
    }
}

struct Screen_Previews: PreviewProvider {
    static var previews: some View {
        Screen(text: "Screen", color: Color(.systemRed))
    }
}
