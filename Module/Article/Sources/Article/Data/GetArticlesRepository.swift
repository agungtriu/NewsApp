//
//  File.swift
//  
//
//  Created by Agung Tri Utomo on 08/12/21.
//

import Core
import Combine
 
public struct GetArticlesRepository<
    RemoteDataSource: DataSource,
    Transformer: Mapper>: Repository
where
    RemoteDataSource.Response == [ArticleResponse],
    Transformer.Response == [ArticleResponse],
    Transformer.Entity == [ArticleModuleEntity],
    Transformer.Domain == [ArticleDomainModel] {
    public typealias Request = Any
    public typealias Response = [ArticleDomainModel]
    private let _remoteDataSource: RemoteDataSource
    private let _mapper: Transformer
    public init(
        remoteDataSource: RemoteDataSource,
        mapper: Transformer) {
        _remoteDataSource = remoteDataSource
        _mapper = mapper
    }
    public func execute(request: Any?) -> AnyPublisher<[ArticleDomainModel], Error> {
        return _remoteDataSource.execute(request: nil)
            .map { _mapper.transformResponseToDomain(response: $0) }
            .eraseToAnyPublisher()
    }
}
