//
//  File.swift
//  
//
//  Created by Agung Tri Utomo on 08/12/21.
//

import Core
import Combine
 
public struct GetBookmarkArticlesRepository<
    ArticleLocaleDataSource: LocaleDataSource,
    Transformer: Mapper>: Repository
where
    ArticleLocaleDataSource.Response == ArticleModuleEntity,
    Transformer.Response == [ArticleResponse],
    Transformer.Entity == [ArticleModuleEntity],
    Transformer.Domain == [ArticleDomainModel] {
    public typealias Request = Any
    public typealias Response = [ArticleDomainModel]
    private let _localeDataSource: ArticleLocaleDataSource
    private let _mapper: Transformer
    public init(
        localeDataSource: ArticleLocaleDataSource,
        mapper: Transformer) {
        _localeDataSource = localeDataSource
        _mapper = mapper
    }
    public func execute(request: Request?) ->
        AnyPublisher<Response, Error> {
            return _localeDataSource.list(request: nil)
                .map { _mapper.transformEntityToDomain(entity: $0)}
                .eraseToAnyPublisher()
    }
}
