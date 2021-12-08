//
//  ContentView.swift
//  News
//
//  Created by Agung Tri Utomo on 02/12/21.
//

import SwiftUI
import Core
import Article

struct ContentView: View {
    @EnvironmentObject var newsPresenter: GetListPresenter<Any,
            ArticleDomainModel,
            Interactor<Any,
                        [ArticleDomainModel],
                        GetArticlesRepository<
                            GetArticlesRemoteDataSource,
                            ArticlesTransformer
                        >
            >
    >
    @EnvironmentObject var bookmarkPresenter: GetListPresenter<Any,
           ArticleDomainModel,
           Interactor<Any,
                       [ArticleDomainModel],
                       GetBookmarkArticlesRepository<
                           GetArticlesLocaleDataSource,
                           ArticlesTransformer
                       >
           >
   >
    @State var selectedIndex = 0
    let tabBarImageNamesSelected = ["icon_newspaper_on", "icon_bookmark_solid", "icon_user_solid"]
    let tabBarImageNames = ["icon_newspaper_off", "icon_bookmark", "icon_user"]
    let tabBarNames = ["News", "Bookmark", "Profile"]
    init() {
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [.font: UIFont(name: "Mulish-Bold", size: 20)!,
                                                            .foregroundColor: UIColor.white]
        UINavigationBar.appearance().barTintColor = UIColor.black
    }
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                VStack(spacing: 0) {
                    switch selectedIndex {
                    case 0:
                        NewsListView(presenter: newsPresenter)
                    case 1:
                        BookmarkListView(presenter: bookmarkPresenter)
                    case 2:
                        AboutMeView()
                    default:
                        Text("Remaining tabs")
                    }
                    HStack {
                        Spacer()
                        ForEach(0..<3) { number in
                            Button(action: {
                                selectedIndex = number
                            }, label: {
                                VStack {
                                    Image(selectedIndex == number ?
                                          tabBarImageNamesSelected[number] : tabBarImageNames[number])
                                    Text(tabBarNames[number])
                                        .font(Font.custom("Mulish-Regular", size: 13))
                                        .foregroundColor(selectedIndex == number ? Color(.white) : Color(hex: 0xA8A8A8))
                                }
                                .padding(EdgeInsets(top: 8, leading: 24, bottom: 8, trailing: 24 ))
                            })
                        }
                        Spacer()
                    }.background(Color(hex: 0x121212))
                }
            }
            .navigationBarTitle("News")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
