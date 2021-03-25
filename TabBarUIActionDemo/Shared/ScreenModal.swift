//
//  ScreenModal.swift
//  CustomTabBar
//
//  Created by Fabrizio Duroni on 06.03.20.
//

import SwiftUI

struct ScreenModal: View {
    @Binding var showModal: Bool

    var body: some View {
        Screen(text: "Modal", color: Color(.systemOrange)) {
            Button("Close") {
                showModal.toggle()
            }
        }
    }
}

struct ScreenModal_Previews: PreviewProvider {
    static var previews: some View {
        ScreenModal(showModal: .constant(false))
    }
}
