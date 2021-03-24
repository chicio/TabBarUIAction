//
//  ShowModalTabBarItem.swift
//  CustomTabBar
//
//  Created by Fabrizio Duroni on 06.03.20.
//

import SwiftUI

public struct ModalTabBarItemContent: View {
    public var body: some View {
        Image(systemName: "plus.circle.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 55, height: 55, alignment: .center)
            .foregroundColor(Color(.systemBlue))
            .background(Color(.white))
            .cornerRadius(55/2)
            .overlay(RoundedRectangle(cornerRadius: 55/2).stroke(Color(.blue), lineWidth: 2))
    }
}

public struct ModalTabBarItem: View {
    let modalTabBarItemContent: AnyView
    let action: () -> Void
    
    public init(modalTabBarItemContent: AnyView, action: @escaping () -> Void) {
        self.modalTabBarItemContent = modalTabBarItemContent
        self.action = action
    }
    
    public var body: some View {
        Group {
            VStack(spacing: 0) {
                self.modalTabBarItemContent
            }
            .onTapGesture(perform: action)
        }
    }
}

struct ShowModalTabBarItem_Previews: PreviewProvider {
    static var previews: some View {
        ModalTabBarItem(modalTabBarItemContent: AnyView(Image(systemName: "plus.circle.fill")
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fit)
                                                            .frame(width: 55, height: 55, alignment: .center)
                                                            .foregroundColor(Color(.systemBlue))
                                                            .background(Color(.white))
                                                            .cornerRadius(55/2)
                                                            .overlay(RoundedRectangle(cornerRadius: 55/2).stroke(Color(.blue), lineWidth: 2)))) {
            
        }
    }
}
