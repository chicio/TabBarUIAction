//
//  TabItemContent.swift
//  TabBarUIAction iOS
//
//  Created by Fabrizio Duroni on 23/03/21.
//

import SwiftUI

public struct TabItemContent: View {
    private var systemImageName: String?
    private var imageName: String?
    private let text: String
    private let font: Font

    public init(systemImageName: String, text: String, font: Font) {
        self.systemImageName = systemImageName
        self.text = text
        self.font = font
    }

    public init(imageName: String, text: String, font: Font) {
        self.imageName = imageName
        self.text = text
        self.font = font
    }

    public var body: some View {
        VStack(alignment: .center, spacing: 0) {
            if let validSystemImageName = systemImageName {
                Image(systemName: validSystemImageName)
                    .accessibility(identifier: self.text.getAccessibilityIdentifier(suffix: "SystemImage"))
                    .allowsHitTesting(true)
            }
            if let validImageName = imageName {
                Image(validImageName)
                    .accessibility(identifier: self.text.getAccessibilityIdentifier(suffix: "Image"))
            }
            Text(self.text)
                .font(self.font)
                .lineLimit(1)
                .padding(.top, 5)
                .accessibility(identifier: self.text.getAccessibilityIdentifier(suffix: "Text"))
                .allowsHitTesting(true)
        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 5)
        .accessibilityElement(children: .contain)
        .accessibility(identifier: self.text.getAccessibilityIdentifier(suffix: "TabItemContent"))
    }
}
