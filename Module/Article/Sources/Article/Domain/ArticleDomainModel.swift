//
//  File.swift
//  
//
//  Created by Agung Tri Utomo on 08/12/21.
//

public struct ArticleDomainModel: Equatable, Identifiable {
    public let id: String
    public let source: String
    public let author: String
    public let title: String
    public let description: String
    public let url: String
    public let urlToImage: String
    public let publishedAt: String
    public let content: String
}
