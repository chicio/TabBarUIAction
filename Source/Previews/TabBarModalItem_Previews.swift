//
//  TabBarModalItem_Previews.swift
//  TabBarUIAction
//
//  Created by Fabrizio Duroni on 29/03/21.
//

import SwiftUI

#if !TEST
struct TabBarModalItem_Previews: PreviewProvider {
    static var previews: some View {
        TabBarModalItem(modalTabBarItemContent: AnyView(
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 55, height: 55, alignment: .center)
                                .foregroundColor(Color(.systemBlue))
                                .background(Color(.white))
                                .cornerRadius(55/2)
                                .overlay(RoundedRectangle(cornerRadius: 55/2).stroke(Color(.blue), lineWidth: 2)))
        ) { }
    }
}
#endif
