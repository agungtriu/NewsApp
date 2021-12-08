//
//  NewsListView.swift
//  News
//
//  Created by Agung Tri Utomo on 02/12/21.
//

import SwiftUI
import Core
import Article

struct NewsListView: View {
    @ObservedObject var presenter: GetListPresenter<Any,
            ArticleDomainModel,
            Interactor<Any,
                        [ArticleDomainModel],
                        GetArticlesRepository<
                            GetArticlesRemoteDataSource,
                            ArticlesTransformer
                        >
            >
    >
    var body: some View {
        ZStack {
            if presenter.isLoading {
                VStack {
                    Spacer()
                    ActivityIndicator()
                    Spacer()
                }
            } else {
                if self.presenter.result.isEmpty {
                    NoDataView()
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        ForEach(self.presenter.result, id: \.id) { article in
                            ZStack {
                                linkBuilder(for: article) {
                                    RowView(article: article)
                                }
                            }.buttonStyle(PlainButtonStyle())
                        }
                    }
                }
            }
        }.onAppear {
            self.presenter.getList(request: nil)
        }
    }
    func linkBuilder<Content: View>(
        for article: ArticleDomainModel,
        @ViewBuilder content: () -> Content
    ) -> some View {
        NavigationLink(
            destination: NewsRouter.makeDetailView(for: article)
        ) { content() }
    }
}
