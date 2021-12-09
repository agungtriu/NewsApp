//
//  File.swift
//  
//
//  Created by Agung Tri Utomo on 08/12/21.
//

import Core
import Foundation

public struct ArticlesTransformer: Mapper {
    public typealias Request = Any
    public typealias Response = [ArticleResponse]
    public typealias Entity = [ArticleModuleEntity]
    public typealias Domain = [ArticleDomainModel]
    
    public init() {}
    
    
    public func transformResponseToDomain(response: [ArticleResponse]) -> [ArticleDomainModel] {
        return response.map { result in
            return ArticleDomainModel(
              id: result.publishedAt ?? UUID().uuidString,
              source: result.source.name ?? "Unknow",
              author: result.author ?? "Unknow",
              title: result.title ?? "Unknow",
              description: result.description ?? "Unknow",
              url: result.url ?? "https://s.id/LyP3-",
              urlToImage: result.urlToImage ?? "https://s.id/LyP3-",
              publishedAt: result.publishedAt ?? "Unknow",
              content: result.content ?? "Unknow"
            )
        }
    }
    public func transformEntityToDomain(entity: [ArticleModuleEntity]) -> [ArticleDomainModel] {
        return entity.map { result in
            return ArticleDomainModel(
            id: result.id,
            source: result.source,
            author: result.author,
            title: result.title,
            description: result.desc,
            url: result.url,
            urlToImage: result.urlToImage,
            publishedAt: result.publishedAt,
            content: result.content
          )
        }
    }
    public func transformDomainToEntity(domain: [ArticleDomainModel]) -> [ArticleModuleEntity] {
        return domain.map { result in
            let newArticle = ArticleModuleEntity()
            newArticle.id = result.id
            newArticle.source = result.source
            newArticle.author = result.author
            newArticle.title = result.title
            newArticle.desc = result.description
            newArticle.url = result.url
            newArticle.urlToImage = result.urlToImage
            newArticle.publishedAt = result.publishedAt
            newArticle.content = result.content
            return newArticle
        }
    }
}
