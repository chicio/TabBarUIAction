//
//  TabItemContent.swift
//  TabBarUIAction iOS
//
//  Created by Fabrizio Duroni on 23/03/21.
//

import SwiftUI

public struct TabItemContent: View {
    public init() {}

    public var body: some View {
        VStack {
            Image(systemName: "gear")
            Text("Tab item").lineLimit(1)
        }
    }
}
