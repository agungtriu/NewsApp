//
//  NewsModel.swift
//  News
//
//  Created by Agung Tri Utomo on 02/12/21.
//

struct ArticleModel: Equatable, Identifiable {
    let id: String
    let source: String
    let author: String
    let title: String
    let description: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    let content: String
}
