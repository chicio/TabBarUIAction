//
//  String+AccessibilityIdentifier.swift
//  TabBarUIAction Demo
//
//  Created by Fabrizio Duroni on 26/03/21.
//

import Foundation

extension String {
    func getAccessibilityIdentifier(suffix: String) -> String {
        return "\(self.replacingOccurrences(of: "\\s", with: "", options: .regularExpression))\(suffix)"
    }
}
