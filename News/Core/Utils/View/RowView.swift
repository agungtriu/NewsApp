//
//  NewsRowView.swift
//  News
//
//  Created by Agung Tri Utomo on 02/12/21.
//

import SwiftUI
import URLImage

struct RowView: View {
    var article: ArticleModel
    var body: some View {
        ZStack {
            Color(hex: 0x202020).ignoresSafeArea().cornerRadius(10)
            VStack {
                URLImage((URL(string: article.urlToImage) ?? URL(string: "https://s.id/LyP3-"))! ) { proxy in
                    proxy.resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width-32,
                               height: UIScreen.main.bounds.height/5,
                               alignment: .center)
                        .clipped()
                        .cornerRadius(10, corners: [.topLeft, .topRight])
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                }
                VStack(alignment: .leading, spacing: 0, content: {
                    Text(article.title)
                        .fixedSize(horizontal: false, vertical: true)
                        .font(Font.custom("Mulish-Bold", size: 17))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                    Spacer()
                    Text(article.description)
                        .fixedSize(horizontal: false, vertical: true)
                        .font(Font.custom("Mulish-Regular", size: 15))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                    Spacer()
                    HStack {
                        Text(article.source)
                            .fixedSize(horizontal: false, vertical: true)
                            .font(Font.custom("Mulish-Regular", size: 13))
                            .foregroundColor(.gray)
                        Image("icon_ellipse").imageScale(.large)
                        Text(Utils.convertDate(date: article.publishedAt)!.timeAgoSinceDate())
                            .fixedSize(horizontal: false, vertical: true)
                            .font(Font.custom("Mulish-Regular", size: 13))
                            .foregroundColor(.gray)
                        Spacer()
                    }
                }).padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
            }
        }.padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
    }
}
