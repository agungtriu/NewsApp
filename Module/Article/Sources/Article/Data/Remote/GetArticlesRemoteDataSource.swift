//
//  File.swift
//  
//
//  Created by Agung Tri Utomo on 08/12/21.
//

import Core
import Combine
import Alamofire
import Foundation
 
public struct GetArticlesRemoteDataSource: DataSource {
    public typealias Request = Any
    public typealias Response = [ArticleResponse]
    private let _endpoint: String
    public init(endpoint: String) {
        _endpoint = endpoint
    }
    public func execute(request: Any?) -> AnyPublisher<[ArticleResponse], Error> {
        return Future<[ArticleResponse], Error> { completion in
          if let url = URL(string: _endpoint) {
            AF.request(url)
              .validate()
              .responseDecodable(of: ArticlesResponse.self) { response in
                switch response.result {
                case .success(let value):
                  completion(.success(value.articles))
                case .failure:
                  completion(.failure(URLError.invalidResponse))
                }
              }
          }
        }.eraseToAnyPublisher()
    }
}
