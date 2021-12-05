//
//  DetailView.swift
//  News
//
//  Created by Agung Tri Utomo on 02/12/21.
//

import SwiftUI

struct DetailView: View {
    @State var isBookmarked = false
    @ObservedObject var presenter: DetailPresenter
    var article: ArticleModel
    init(presenter: DetailPresenter, article: ArticleModel) {
        self.presenter = presenter
        self.article = article
        self.presenter.getBookmarkedArticle(articleId: self.article.id)
        isBookmarked = self.presenter.resultBookmarked
    }
    var body: some View {
        WebView(request: URLRequest(url: URL(string: article.url)!))
            .background(Color.black)
            .navigationBarTitle("News")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                trailing:
                    isBookmarked ?
                Button(action: {
                    presenter.deleteBookmarkArticle(articleId: article.id)
                    isBookmarked = presenter.resultDelete
                }, label: {
                    Image("icon_bookmark_solid").imageScale(.large)
                })
                :
                    Button(action: {
                        presenter.addBookmarkArticle(article: article)
                        isBookmarked = !presenter.resultAdd
                    }, label: {
                        Image("icon_bookmark").imageScale(.large)
                    })
            )
            .onAppear {
                presenter.getBookmarkedArticle(articleId: article.id)
                isBookmarked = presenter.resultBookmarked
            }
    }
}
