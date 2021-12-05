//
//  NewsRepository.swift
//  News
//
//  Created by Agung Tri Utomo on 02/12/21.
//

import Foundation
import Combine
import RxSwift
protocol NewsRepositoryProtocol {
    func getArticles() -> AnyPublisher<[ArticleModel], Error>
    func getBookmarkedArticles() -> AnyPublisher<[ArticleModel], Error>
    func getBookmarkedArticle(articleId: String) -> AnyPublisher<Bool, Error>
    func addBookmarkArticle(article: ArticleModel) -> AnyPublisher<Bool, Error>
    func deleteBookmarkArticle(articleId: String) -> AnyPublisher<Bool, Error>
}

final class NewsRepository: NSObject {
    typealias NewsInstance = (LocaleDataSource, RemoteDataSource) -> NewsRepository
    fileprivate let remote: RemoteDataSource
    fileprivate let locale: LocaleDataSource
    private init(locale: LocaleDataSource, remote: RemoteDataSource) {
        self.locale = locale
        self.remote = remote
    }
    static let sharedInstance: NewsInstance = { localeRepo, remoteRepo in
        return NewsRepository(locale: localeRepo, remote: remoteRepo)
    }
}

extension NewsRepository: NewsRepositoryProtocol {
    func getArticles() -> AnyPublisher<[ArticleModel], Error> {
        return self.remote.getArticles()
            .map { ArticleMapper.mapArticleResponsesToDomains(input: $0) }
            .eraseToAnyPublisher()
    }
    func getBookmarkedArticles() -> AnyPublisher<[ArticleModel], Error> {
        return self.locale.getArticles()
            .map { ArticleMapper.mapArticleEntitiesToDomains(input: $0) }
            .eraseToAnyPublisher()
    }
    func getBookmarkedArticle(articleId: String) -> AnyPublisher<Bool, Error> {
        return self.locale.getBookmarkedArticle(from: articleId)
            .eraseToAnyPublisher()
    }
    func addBookmarkArticle(article: ArticleModel) -> AnyPublisher<Bool, Error> {
        return self.locale.addBookmarkArticle(from: ArticleMapper.mapArticleDomainToEntity(input: article))
            .eraseToAnyPublisher()
    }
    func deleteBookmarkArticle(articleId: String) -> AnyPublisher<Bool, Error> {
        return self.locale.deleteBookmarkArticle(from: articleId)
            .eraseToAnyPublisher()
    }
}
