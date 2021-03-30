//
//  TabItemContent.swift
//  TabBarUIAction iOS
//
//  Created by Fabrizio Duroni on 23/03/21.
//

import SwiftUI

/**
 A struct used to define a tab item content.
 This correspond to the content of the tab bar item elements: image and text shown in the tab bar.
 */
public struct TabItemContent: View {
    private var systemImageName: String?
    private var imageName: String?
    private let text: String
    private let font: Font

    /**
     Creates a `TabItemContent` instance.
     
     - parameter systemImageName: the system image used as tab bar item icon.
     - parameter text: the text used as label for the tab bar item.
     */
    public init(systemImageName: String, text: String, font: Font) {
        self.systemImageName = systemImageName
        self.text = text
        self.font = font
    }

    /**
     Creates a `TabItemContent` instance.
     
     - parameter imageName: a generic image used as tab bar item icon.
     - parameter text: the text used as label for the tab bar item.
     */
    public init(imageName: String, text: String, font: Font) {
        self.imageName = imageName
        self.text = text
        self.font = font
    }

    /// The body of TabItemContent. It create a view with icon and label for a tab bar item.
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
