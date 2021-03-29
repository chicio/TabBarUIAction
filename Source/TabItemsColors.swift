//
//  TabItemColors.swift
//  TabBarUIAction
//
//  Created by Fabrizio Duroni on 25/03/21.
//

import SwiftUI

/**
 A struct used to define the tab items colors.
 */
public struct TabItemsColors {
    let tabItemColor: Color
    let tabItemSelectionColor: Color

    public init(tabItemColor: Color, tabItemSelectionColor: Color) {
        self.tabItemColor = tabItemColor
        self.tabItemSelectionColor = tabItemSelectionColor
    }
}
