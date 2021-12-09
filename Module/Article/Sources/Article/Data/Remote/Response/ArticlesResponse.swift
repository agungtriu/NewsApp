//
//  File.swift
//  
//
//  Created by Agung Tri Utomo on 08/12/21.
//

public struct ArticlesResponse: Decodable {
    let status: String
    let totalResults: Int
    let articles: [ArticleResponse]
}

public struct ArticleResponse: Decodable {
    let source: SourceResponse
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    private enum CodingKeys: String, CodingKey {
        case source
        case author
        case title
        case description
        case url
        case urlToImage
        case publishedAt
        case content
    }
}

public struct SourceResponse: Decodable, Equatable {
    let id: Int?
    let name: String?
}
