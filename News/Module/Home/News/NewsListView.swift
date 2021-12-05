//
//  NewsListView.swift
//  News
//
//  Created by Agung Tri Utomo on 02/12/21.
//

import SwiftUI

struct NewsListView: View {
    @ObservedObject var presenter: NewsPresenter
    var body: some View {
        ZStack {
            if presenter.loadingState {
                VStack {
                    Spacer()
                    ActivityIndicator()
                    Spacer()
                }
            } else {
                if self.presenter.articles.isEmpty {
                    NoDataView()
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        ForEach(self.presenter.articles, id: \.id) { article in
                            ZStack {
                                self.presenter.linkBuilder(for: article) {
                                    RowView(article: article)
                                }.buttonStyle(PlainButtonStyle())
                            }.padding(8)
                        }
                    }
                }
            }
        }.onAppear {
            self.presenter.getArticles()
        }
    }
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        let newsListUseCase = Injection.init().provideNews()
        let newsPresenter = NewsPresenter(newsUseCase: newsListUseCase)
        NewsListView(presenter: newsPresenter)
    }
}
