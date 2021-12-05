//
//  BookmarkListView.swift
//  News
//
//  Created by Agung Tri Utomo on 02/12/21.
//

import SwiftUI

struct BookmarkListView: View {
    @ObservedObject var presenter: BookmarkPresenter
    var body: some View {
        ZStack {
            if presenter.loadingState {
                VStack {
                    Spacer()
                    ActivityIndicator()
                    Spacer()
                }
            } else {
                if presenter.articles.isEmpty {
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
            self.presenter.getBookmarks()
        }
    }
}

struct BookmarkListView_Previews: PreviewProvider {
    static var previews: some View {
        let bookmarkListUseCase = Injection.init().provideBookmark()
        let bookmarkPresenter = BookmarkPresenter(bookmarkUseCase: bookmarkListUseCase)
        BookmarkListView(presenter: bookmarkPresenter)
    }
}
