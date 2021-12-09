//
//  File.swift
//  
//
//  Created by Agung Tri Utomo on 08/12/21.
//

import Core
import Combine
 
public struct GetBookmarkArticleRepository<
    ArticleLocaleDataSource: LocaleDataSource>: Repository
where
    ArticleLocaleDataSource.Response == ArticleModuleEntity {
    public typealias Request = String
    public typealias Response = Bool
    private let _localeDataSource: ArticleLocaleDataSource
    public init(localeDataSource: ArticleLocaleDataSource) {
        _localeDataSource = localeDataSource
    }
    public func execute(request: String?) -> AnyPublisher<Bool, Error> {
        return _localeDataSource.get(id: request!)
            .eraseToAnyPublisher()
    }
}
