//
//  DetailView.swift
//  News
//
//  Created by Agung Tri Utomo on 02/12/21.
//

import SwiftUI
import Article
import Core

struct DetailView: View {
    @State var isBookmarked = false
    @ObservedObject var getPresenter: GetPresenter<String,
                                                   Bool,
                                                   Interactor<String,
                                                              Bool,
                                                              GetBookmarkArticleRepository<GetArticlesLocaleDataSource>>>
    @ObservedObject var addPresenter: GetPresenter<ArticleDomainModel,
                                                   Bool,
                                                   Interactor<ArticleDomainModel,
                                                              Bool,
                                                              AddBookmarkArticleRepository<GetArticlesLocaleDataSource,
                                                                                           ArticleTransformer>>>
    @ObservedObject var deletePresenter: GetPresenter<String,
                                                      Bool,
                                                      Interactor<String,
                                                                 Bool,
                                                                 DeleteBookmarkArticleRepository<GetArticlesLocaleDataSource>>>
    var article: ArticleDomainModel
    init(
        getPresenter: GetPresenter<String, Bool, Interactor<String, Bool, GetBookmarkArticleRepository<GetArticlesLocaleDataSource>>>,
        addPresenter: GetPresenter<ArticleDomainModel, Bool, Interactor<ArticleDomainModel, Bool, AddBookmarkArticleRepository<GetArticlesLocaleDataSource, ArticleTransformer>>>,
        deletePresenter: GetPresenter<String, Bool, Interactor<String, Bool, DeleteBookmarkArticleRepository<GetArticlesLocaleDataSource>>>,
        article: ArticleDomainModel
    ) {
        self.getPresenter = getPresenter
        self.addPresenter = addPresenter
        self.deletePresenter = deletePresenter
        self.article = article
        self.getPresenter.get(request: self.article.id)
        isBookmarked = self.getPresenter.result ?? false
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
                    deletePresenter.get(request: article.id)
                    isBookmarked = deletePresenter.result ?? false
                }, label: {
                    Image("icon_bookmark_solid").imageScale(.large)
                })
                :
                    Button(action: {
                        addPresenter.get(request: article)
                        isBookmarked = addPresenter.result ?? false
                        isBookmarked = !isBookmarked
                    }, label: {
                        Image("icon_bookmark").imageScale(.large)
                    })
            )
            .onAppear {
                self.getPresenter.get(request: self.article.id)
                isBookmarked = self.getPresenter.result ?? false
            }
    }
}
