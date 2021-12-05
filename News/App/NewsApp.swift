//
//  NewsApp.swift
//  News
//
//  Created by Agung Tri Utomo on 02/12/21.
//

import SwiftUI

@main
struct NewsApp: App {
    var body: some Scene {
        WindowGroup {
            let newsListUseCase = Injection.init().provideNews()
            let newsPresenter = NewsPresenter(newsUseCase: newsListUseCase)
            let bookmarkListUseCase = Injection.init().provideBookmark()
            let bookmarkPresenter = BookmarkPresenter(bookmarkUseCase: bookmarkListUseCase)
            ContentView().environmentObject(newsPresenter).environmentObject(bookmarkPresenter)
        }
    }
}
