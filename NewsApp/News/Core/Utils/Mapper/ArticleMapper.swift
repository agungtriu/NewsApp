//
//  ArticleMapper.swift
//  News
//
//  Created by Agung Tri Utomo on 02/12/21.
//

import Foundation

final class ArticleMapper {
    static func mapArticleResponsesToDomains(
        input articleResponses: [ArticleResponse]
    ) -> [ArticleModel] {
        return articleResponses.map { result in
            return ArticleModel(
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
    static func mapArticleResponsesToEntities(
        input articleResponses: [ArticleResponse]
    ) -> [ArticleEntity] {
        return articleResponses.map { result in
            let newArticle = ArticleEntity()
            newArticle.id = result.publishedAt ?? UUID().uuidString
            newArticle.source = result.source.name ?? "Unknow"
            newArticle.author = result.author ?? "Unknow"
            newArticle.title = result.title ?? "Unknow"
            newArticle.desc = result.description ?? "Unknow"
            newArticle.url = result.url ?? "https://s.id/LyP3-"
            newArticle.urlToImage = result.urlToImage ?? "https://s.id/LyP3-"
            newArticle.publishedAt = result.publishedAt ?? "Unknow"
            newArticle.content = result.content ?? "Unknow"
            return newArticle
        }
    }
    static func mapArticleEntitiesToDomains(
        input articleEntities: [ArticleEntity]
    ) -> [ArticleModel] {
        return articleEntities.map { result in
            return ArticleModel(
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
    static func mapArticleDomainToEntity(
        input articleModel: ArticleModel
    ) -> ArticleEntity {
        let newArticle = ArticleEntity()
        newArticle.id = articleModel.id
        newArticle.source = articleModel.source
        newArticle.author = articleModel.author
        newArticle.title = articleModel.title
        newArticle.desc = articleModel.description
        newArticle.url = articleModel.url
        newArticle.urlToImage = articleModel.urlToImage
        newArticle.publishedAt = articleModel.publishedAt
        newArticle.content = articleModel.content
        return newArticle
    }
}
