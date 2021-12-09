//
//  File.swift
//  
//
//  Created by Agung Tri Utomo on 08/12/21.
//

import Core
import Combine
 
public struct DeleteBookmarkArticleRepository<
    ArticleLocaleDataSource: LocaleDataSource>: Repository
where
    ArticleLocaleDataSource.Response == ArticleModuleEntity {
    public typealias Request = String
    public typealias Response = Bool
    private let _localeDataSource: ArticleLocaleDataSource
    public init(localeDataSource: ArticleLocaleDataSource) {
        _localeDataSource = localeDataSource
    }
    public func execute(request: Request?) -> AnyPublisher<Response, Error> {
        return _localeDataSource.delete(id: request!)
            .eraseToAnyPublisher()
    }
}
