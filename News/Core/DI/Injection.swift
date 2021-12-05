//
//  Injection.swift
//  News
//
//  Created by Agung Tri Utomo on 02/12/21.
//

import Foundation
import RealmSwift
final class Injection: NSObject {
    private func provideRepository() -> NewsRepositoryProtocol {
        let realm = try? Realm()
        let locale: LocaleDataSource = LocaleDataSource.sharedInstance(realm)
        let remote: RemoteDataSource = RemoteDataSource.sharedInstance
        return NewsRepository.sharedInstance(locale, remote)
    }
    func provideNews() -> NewsUseCase {
        let repository = provideRepository()
        return NewsInteractor(repository: repository)
    }
    func provideBookmark() -> BookmarkUseCase {
        let repository = provideRepository()
        return BookmarkInteractor(repository: repository)
    }
    func provideDetail(article: ArticleModel) -> DetailUseCase {
        let repository = provideRepository()
        return DetailInteractor(repository: repository, article: article)
    }
}
