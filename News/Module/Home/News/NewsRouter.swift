//
//  NewsRouter.swift
//  News
//
//  Created by Agung Tri Utomo on 02/12/21.
//

import SwiftUI

class NewsRouter {
    func makeDetailView(for article: ArticleModel) -> some View {
        let detailUseCase = Injection.init().provideDetail(article: article)
        let presenter = DetailPresenter(detailUseCase: detailUseCase)
        return DetailView(presenter: presenter, article: article)
    }
}
