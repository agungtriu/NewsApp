//
//  BookmarkRouter.swift
//  News
//
//  Created by Agung Tri Utomo on 04/12/21.
//

import SwiftUI

class BookmarkRouter {
    func makeDetailView(for article: ArticleModel) -> some View {
        let detailUseCase = Injection.init().provideDetail(article: article)
        let presenter = DetailPresenter(detailUseCase: detailUseCase)
        return DetailView(presenter: presenter, article: article)
    }
}
