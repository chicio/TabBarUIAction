//
//  Colors.swift
//  TabBarUIAction
//
//  Created by Fabrizio Duroni on 25/03/21.
//

import SwiftUI

public struct Colors {
    let tabBarColor: Color
    let tabItemColors: TabItemColors

    public init(tabBarColor: Color, tabItemColor: Color, tabItemSelectionColor: Color) {
        self.tabBarColor = tabBarColor
        self.tabItemColors = TabItemColors(tabItemColor: tabItemColor, tabItemSelectionColor: tabItemSelectionColor)
    }
}
