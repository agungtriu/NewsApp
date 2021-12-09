//
//  BookmarkPresenter.swift
//  News
//
//  Created by Agung Tri Utomo on 04/12/21.
//

import SwiftUI
import Combine

class BookmarkPresenter: ObservableObject {
    private var cancellables: Set<AnyCancellable> = []
    private let router = BookmarkRouter()
    private let bookmarkUseCase: BookmarkUseCase
    @Published var articles: [ArticleModel] = []
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = false
    init(bookmarkUseCase: BookmarkUseCase) {
        self.bookmarkUseCase = bookmarkUseCase
    }
    func getBookmarks() {
        loadingState = true
        bookmarkUseCase.getBookmarks()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure:
                    self.errorMessage = String(describing: completion)
                    self.loadingState = false
                case .finished:
                    self.loadingState = false
                }
            }, receiveValue: { articles in
                self.articles = articles
            })
            .store(in: &cancellables)
    }
//    func linkBuilder<Content: View>(
//        for article: ArticleModel,
//        @ViewBuilder content: () -> Content
//    ) -> some View {
//        NavigationLink(
//            destination: router.makeDetailView(for: article)) { content() }
//    }
}
