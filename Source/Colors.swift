//
//  Colors.swift
//  TabBarUIAction
//
//  Created by Fabrizio Duroni on 25/03/21.
//

import SwiftUI

/**
 A struct used to define the colors of the TabBarUIAction view.
 */
public struct Colors {
    /// The tab bar background color.
    let tabBarBackgroundColor: Color
    /// The tab bar items color. See `TabItemsColors`.
    let tabItemColors: TabItemsColors

    /**
     Creates a `Colors` instance.
     
     - parameter tabBarBackgroundColor: the tab bar background color.
     - parameter tabItemsColors: the binding value to get the max value selected.
     */
    public init(tabBarBackgroundColor: Color, tabItemsColors: TabItemsColors) {
        self.tabBarBackgroundColor = tabBarBackgroundColor
        self.tabItemColors = tabItemsColors
    }
}
