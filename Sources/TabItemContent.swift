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

    public init(systemImageName: String) {
        self.systemImageName = systemImageName
    }

    public init(imageName: String) {
        self.imageName = imageName
    }

    public var body: some View {
        VStack(alignment: .center, spacing: 0) {
            if let validSystemImageName = systemImageName {
                Image(systemName: validSystemImageName)
            }
            if let validImageName = imageName {
                Image(validImageName)
            }
            Text("Tab item")
                .lineLimit(1)
                .padding(.top, 5)
        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 5)
    }
}
