//
//  ScreenForm.swift
//  TabBarUIActionDemo
//
//  Created by Fabrizio Duroni on 25/03/21.
//

import SwiftUI

struct ScreenForm: View {
    let title: String
    @Binding var text: String

    var body: some View {
        Form {
            Label("Field", systemImage: "pencil")
            TextField("field", text: $text)
                .background(Color(.white))
                .multilineTextAlignment(.center)
        }
        .padding(0)
        .background(Color.clear)
        .navigationTitle(title)
    }
}
