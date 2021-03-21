//
//  ScreenDetail.swift
//  CustomTabBar
//
//  Created by Fabrizio Duroni on 06.03.20.
//

import SwiftUI

struct ScreenDetail: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Text("Detail Screen")
                    .font(.system(size: 20))
                    .bold()
                Spacer()
            }
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .background(Color(.green).opacity(0.2))
        .navigationBarTitle("Detail Screen")
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct ScreenDetail_Previews: PreviewProvider {
    static var previews: some View {
        ScreenDetail()
    }
}
