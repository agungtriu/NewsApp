//
//  NewsRouter.swift
//  News
//
//  Created by Agung Tri Utomo on 02/12/21.
//

import SwiftUI
import Article
import Core

final class NewsRouter {
    static func makeDetailView(for article: ArticleDomainModel) -> some View {
        let getUseCase: Interactor<
            String,
            Bool,
            GetBookmarkArticleRepository<
                GetArticlesLocaleDataSource
            >
        > = Injection.init().provideBookmarkArticle()
        let getPresenter = GetPresenter(useCase: getUseCase)
        let addUseCase: Interactor<
            ArticleDomainModel,
            Bool,
            AddBookmarkArticleRepository<
                GetArticlesLocaleDataSource,
                ArticleTransformer
            >
        > = Injection.init().provideAddBookmarkArticle()
        let addPresenter = GetPresenter(useCase: addUseCase)
        let deleteUseCase: Interactor<
            String,
            Bool,
            DeleteBookmarkArticleRepository<
                GetArticlesLocaleDataSource
            >
        > = Injection.init().provideDeleteBookmarkArticle()
        let deletePresenter = GetPresenter(useCase: deleteUseCase)
        return DetailView(getPresenter: getPresenter, addPresenter: addPresenter, deletePresenter: deletePresenter, article: article)
    }
}
