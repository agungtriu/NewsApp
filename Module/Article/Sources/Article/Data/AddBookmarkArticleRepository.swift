//
//  File.swift
//  
//
//  Created by Agung Tri Utomo on 08/12/21.
//

import Core
import Combine
 
public struct AddBookmarkArticleRepository<
    ArticleLocaleDataSource: LocaleDataSource,
    Transformer: Mapper>: Repository
where
    ArticleLocaleDataSource.Response == ArticleModuleEntity,
    Transformer.Response == ArticleResponse,
    Transformer.Entity == ArticleModuleEntity,
    Transformer.Domain == ArticleDomainModel {
    public typealias Request = ArticleDomainModel
    public typealias Response = Bool
    private let _localeDataSource: ArticleLocaleDataSource
    private let _mapper: Transformer
    public init(
        localeDataSource: ArticleLocaleDataSource,
        mapper: Transformer) {
        _localeDataSource = localeDataSource
        _mapper = mapper
    }
    public func execute(request: Request?) -> AnyPublisher<Response, Error> {
        return _localeDataSource.add(entity: _mapper.transformDomainToEntity(domain: request!))
            .eraseToAnyPublisher()
    }
}
