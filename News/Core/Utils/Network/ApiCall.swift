//
//  ApiCall.swift
//  News
//
//  Created by Agung Tri Utomo on 02/12/21.
//

import Foundation

struct API {
    static let baseUrl = "https://newsapi.org/v2/"
    static let apiKey = "a84af0c6d1d7451591edffc5b8c66e37"
}

protocol Endpoint {
    var url: String { get }
}

enum Endpoints {
    enum Gets: Endpoint {
        case topHeadlineId
        public var url: String {
            switch self {
            case .topHeadlineId:
                return "\(API.baseUrl)top-headlines?country=id&apiKey=\(API.apiKey)"
            }
        }
    }
}
