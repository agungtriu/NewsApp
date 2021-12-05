//
//  AboutMeView.swift
//  News
//
//  Created by Agung Tri Utomo on 02/12/21.
//

import SwiftUI

struct AboutMeView: View {
    @State private var name = "Agung Tri Utomo"
    @State private var email = "agungtriu@outlook.com"
    @State private var github = "agungtriu"
    @State private var linkedin = "agungtriu"
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                Image("foto")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.height/8*5, height: UIScreen.main.bounds.height/4)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .padding(EdgeInsets(top: 32, leading: 16, bottom: 32, trailing: 16))
                Text(name)
                    .font(Font.custom("Mulish-Bold", size: 17))
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
                VStack(alignment: .leading, spacing: nil, content: {
                    HStack {
                        Image("icon_mail")
                        Text(email)
                            .font(Font.custom("Mulish-Regular", size: 15))
                            .foregroundColor(Color(hex: 0xA8A8A8))
                            .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0))
                    }
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 8, trailing: 16))
                    HStack {
                        Image("icon_github")
                        Text("github.com/\(github)")
                            .font(Font.custom("Mulish-Regular", size: 15))
                            .foregroundColor(Color(hex: 0xA8A8A8))
                            .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0))
                    }
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 8, trailing: 16))
                    HStack {
                        Image("icon_linkedin")
                        Text("linkedin.com/in/\(linkedin)/")
                            .font(Font.custom("Mulish-Regular", size: 15))
                            .foregroundColor(Color(hex: 0xA8A8A8))
                            .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0))
                    }
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
                })
                Spacer()
            }
        }
    }
}

struct AboutMeView_Previews: PreviewProvider {
    static var previews: some View {
        AboutMeView()
    }
}
