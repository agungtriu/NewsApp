//
//  NewsApp.swift
//  News
//
//  Created by Agung Tri Utomo on 02/12/21.
//

import SwiftUI
import Core
import Article
@main
struct NewsApp: App {
    var body: some Scene {
        WindowGroup {
            let articleUseCase: Interactor<
                Any,
                [ArticleDomainModel],
                GetArticlesRepository<
                    GetArticlesRemoteDataSource,
                    ArticlesTransformer
                >
            > = Injection.init().provideArticle()
            let newsPresenter = GetListPresenter(useCase: articleUseCase)
            let bookmarkListUseCase: Interactor<
                Any,
                [ArticleDomainModel],
                GetBookmarkArticlesRepository<
                    GetArticlesLocaleDataSource,
                    ArticlesTransformer
                >
            > = Injection.init().provideBookmarkArticles()
            let bookmarkPresenter = GetListPresenter(useCase: bookmarkListUseCase)
            ContentView().environmentObject(newsPresenter).environmentObject(bookmarkPresenter)
        }
    }
}
