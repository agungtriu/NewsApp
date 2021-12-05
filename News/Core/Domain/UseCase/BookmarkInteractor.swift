//
//  BookmarkInteractor.swift
//  News
//
//  Created by Agung Tri Utomo on 04/12/21.
//

import Foundation
import Combine

protocol BookmarkUseCase {
    func getBookmarks() -> AnyPublisher<[ArticleModel], Error>
}

class BookmarkInteractor: BookmarkUseCase {
    private let repository: NewsRepositoryProtocol
    required init(repository: NewsRepositoryProtocol) {
        self.repository = repository
    }
    func getBookmarks() -> AnyPublisher<[ArticleModel], Error> {
        return repository.getBookmarkedArticles()
    }
}
