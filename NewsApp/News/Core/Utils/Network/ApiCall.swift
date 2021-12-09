//
//  ApiCall.swift
//  News
//
//  Created by Agung Tri Utomo on 02/12/21.
//
import Foundation

struct API {
    static let baseUrl = "https://newsapi.org/v2/"
    static var apiKey: String {
        get {
          guard let filePath = Bundle.main.path(forResource: "News-Info", ofType: "plist") else {
            fatalError("Couldn't find file 'News-Info.plist'.")
          }
          let plist = NSDictionary(contentsOfFile: filePath)
          guard let value = plist?.object(forKey: "API_KEY") as? String else {
            fatalError("Couldn't find key 'API_KEY' in 'News-Info.plist'.")
          }
          return value
        }
      }
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
