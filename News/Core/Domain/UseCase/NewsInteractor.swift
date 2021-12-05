//
//  NewsInteractor.swift
//  News
//
//  Created by Agung Tri Utomo on 02/12/21.
//

import Foundation
import Combine

protocol NewsUseCase {
    func getArticles() -> AnyPublisher<[ArticleModel], Error>
}

class NewsInteractor: NewsUseCase {
    private let repository: NewsRepositoryProtocol
    required init(repository: NewsRepositoryProtocol) {
        self.repository = repository
    }
    func getArticles() -> AnyPublisher<[ArticleModel], Error> {
        return repository.getArticles()
    }
}
