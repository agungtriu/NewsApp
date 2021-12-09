//
//  DetailInteractor.swift
//  News
//
//  Created by Agung Tri Utomo on 02/12/21.
//

import Combine

protocol DetailUseCase {
    func getArticle() -> ArticleModel
    func getBookmarkedArticle(articleId: String) -> AnyPublisher<Bool, Error>
    func addBookmarkArticle(article: ArticleModel) -> AnyPublisher<Bool, Error>
    func deleteBookmarkArticle(articleId: String) -> AnyPublisher<Bool, Error>
}

class DetailInteractor: DetailUseCase {
    private let repository: NewsRepositoryProtocol
    private let article: ArticleModel
    required init(
        repository: NewsRepositoryProtocol,
        article: ArticleModel
    ) {
        self.repository = repository
        self.article = article
    }
    func getArticle() -> ArticleModel {
        return article
    }
    func getBookmarkedArticle(articleId: String) -> AnyPublisher<Bool, Error> {
        return repository.getBookmarkedArticle(articleId: articleId)
    }
    func addBookmarkArticle(article: ArticleModel) -> AnyPublisher<Bool, Error> {
        return repository.addBookmarkArticle(article: article)
    }
    func deleteBookmarkArticle(articleId: String) -> AnyPublisher<Bool, Error> {
        return repository.deleteBookmarkArticle(articleId: articleId)
    }
}
