//
//  TabItemProperties.swift
//  TabBarUIAction
//
//  Created by Fabrizio Duroni on 24/03/21.
//

import Foundation

struct TabItemProperties: Identifiable {
    // swiftlint:disable:next identifier_name
    var id: Int { position.rawValue }
    let position: TabPosition
    let screen: TabScreen
}
