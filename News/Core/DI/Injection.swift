//
//  Injection.swift
//  News
//
//  Created by Agung Tri Utomo on 02/12/21.
//

import Foundation
import RealmSwift
import Core
import Article
final class Injection: NSObject {
//    private func provideRepository() -> NewsRepositoryProtocol {
//        let locale: LocaleDataSource = LocaleDataSource.sharedInstance(realm)
//        let remote: RemoteDataSource = RemoteDataSource.sharedInstance
//        return NewsRepository.sharedInstance(locale, remote)
//    }
//    func provideNews() -> NewsUseCase {
//        let repository = provideRepository()
//        return NewsInteractor(repository: repository)
//    }
//    func provideBookmark() -> BookmarkUseCase {
//        let repository = provideRepository()
//        return BookmarkInteractor(repository: repository)
//    }
//    func provideDetail(article: ArticleModel) -> DetailUseCase {
//        let repository = provideRepository()
//        return DetailInteractor(repository: repository, article: article)
//    }
    let realm = try! Realm()
    func provideArticle<U: UseCase>() -> U where U.Request == Any, U.Response == [ArticleDomainModel] {
        let remote = GetArticlesRemoteDataSource(endpoint: Endpoints.Gets.topHeadlineId.url)
        let mapper = ArticlesTransformer()
        let repository = GetArticlesRepository(
            remoteDataSource: remote,
            mapper: mapper
        )
        return Interactor(repository: repository) as! U
    }
    func provideBookmarkArticles<U: UseCase>() -> U where U.Request == Any, U.Response == [ArticleDomainModel] {
        let locale = GetArticlesLocaleDataSource(realm: realm)
        let mapper = ArticlesTransformer()
        let repository = GetBookmarkArticlesRepository(
            localeDataSource: locale,
            mapper: mapper
        )
        return Interactor(repository: repository) as! U
    }
    func provideBookmarkArticle<U: UseCase>() -> U where U.Request == String, U.Response == Bool {
        let locale = GetArticlesLocaleDataSource(realm: realm)
        let repository = GetBookmarkArticleRepository(
            localeDataSource: locale
        )
        return Interactor(repository: repository) as! U
    }
    func provideAddBookmarkArticle<U: UseCase>() -> U where U.Request == ArticleDomainModel, U.Response == Bool {
        let locale = GetArticlesLocaleDataSource(realm: realm)
        let mapper = ArticleTransformer()
        let repository = AddBookmarkArticleRepository(
            localeDataSource: locale,
            mapper: mapper
        )
        return Interactor(repository: repository) as! U
    }
    func provideDeleteBookmarkArticle<U: UseCase>() -> U where U.Request == String, U.Response == Bool {
        let locale = GetArticlesLocaleDataSource(realm: realm)
        let repository = DeleteBookmarkArticleRepository(
            localeDataSource: locale
        )
        return Interactor(repository: repository) as! U
    }
}
