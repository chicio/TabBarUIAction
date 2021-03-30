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

    /**
     Creates a `TabItemsColors` instance.
     
     - parameter tabItemColor: the tab item color.
     - parameter tabItemSelectionColor: the tab item selection color.
     */
    public init(tabItemColor: Color, tabItemSelectionColor: Color) {
        self.tabItemColor = tabItemColor
        self.tabItemSelectionColor = tabItemSelectionColor
    }
}
