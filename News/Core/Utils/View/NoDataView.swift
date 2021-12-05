//
//  NoDataView.swift
//  News
//
//  Created by Agung Tri Utomo on 04/12/21.
//

import SwiftUI

struct NoDataView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                Text("No Data")
                    .font(Font.custom("Mulish-Regular", size: 17))
                    .foregroundColor(.white)
            }
        }
    }
}

struct NoDataView_Previews: PreviewProvider {
    static var previews: some View {
        NoDataView()
    }
}
