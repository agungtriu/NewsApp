//
//  File.swift
//  
//
//  Created by Agung Tri Utomo on 08/12/21.
//

import Core
import Foundation

public struct ArticleTransformer: Mapper {
    public typealias Request = Any
    public typealias Response = ArticleResponse
    public typealias Entity = ArticleModuleEntity
    public typealias Domain = ArticleDomainModel
    
    public init() {}
    
    public func transformResponseToDomain(response: ArticleResponse) -> ArticleDomainModel {
        return ArticleDomainModel(
          id: response.publishedAt ?? UUID().uuidString,
          source: response.source.name ?? "Unknow",
          author: response.author ?? "Unknow",
          title: response.title ?? "Unknow",
          description: response.description ?? "Unknow",
          url: response.url ?? "https://s.id/LyP3-",
          urlToImage: response.urlToImage ?? "https://s.id/LyP3-",
          publishedAt: response.publishedAt ?? "Unknow",
          content: response.content ?? "Unknow"
        )
    }
    public func transformEntityToDomain(entity: ArticleModuleEntity) -> ArticleDomainModel {
      return ArticleDomainModel(
        id: entity.id,
        source: entity.source,
        author: entity.author,
        title: entity.title,
        description: entity.desc,
        url: entity.url,
        urlToImage: entity.urlToImage,
        publishedAt: entity.publishedAt,
        content: entity.content
      )
    }
    public func transformDomainToEntity(domain: ArticleDomainModel) -> ArticleModuleEntity {
        let newArticle = ArticleModuleEntity()
        newArticle.id = domain.id
        newArticle.source = domain.source
        newArticle.author = domain.author
        newArticle.title = domain.title
        newArticle.desc = domain.description
        newArticle.url = domain.url
        newArticle.urlToImage = domain.urlToImage
        newArticle.publishedAt = domain.publishedAt
        newArticle.content = domain.content
        return newArticle
    }
}
