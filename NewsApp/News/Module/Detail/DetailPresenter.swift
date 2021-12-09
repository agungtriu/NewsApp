//
//  DetailPresenter.swift
//  News
//
//  Created by Agung Tri Utomo on 02/12/21.
//

import SwiftUI
import Combine

class DetailPresenter: ObservableObject {
    private let detailUseCase: DetailUseCase
    private var cancellables: Set<AnyCancellable> = []
    @Published var article: ArticleModel
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = false
    @Published var resultBookmarked: Bool = false
    @Published var resultAdd: Bool = false
    @Published var resultDelete: Bool = false
    init(detailUseCase: DetailUseCase) {
        self.detailUseCase = detailUseCase
        self.article = detailUseCase.getArticle()
    }
    func getBookmarkedArticle(articleId: String) {
        loadingState = true
        detailUseCase.getBookmarkedArticle(articleId: articleId)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure:
                    self.errorMessage = String(describing: completion)
                case .finished:
                    self.loadingState = false
                }
            }, receiveValue: { result in
                self.resultBookmarked = result
            })
            .store(in: &cancellables)
    }
    func addBookmarkArticle(article: ArticleModel) {
        loadingState = true
        detailUseCase.addBookmarkArticle(article: article)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure:
                    self.errorMessage = String(describing: completion)
                case .finished:
                    self.loadingState = false
                }
            }, receiveValue: { result in
                self.resultAdd = result
            })
            .store(in: &cancellables)
    }
    func deleteBookmarkArticle(articleId: String) {
        loadingState = true
        detailUseCase.deleteBookmarkArticle(articleId: articleId)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure:
                    self.errorMessage = String(describing: completion)
                case .finished:
                    self.loadingState = false
                }
            }, receiveValue: { result in
                self.resultDelete = result
            })
            .store(in: &cancellables)
    }
}
