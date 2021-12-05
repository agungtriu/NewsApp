//
//  LocaleDataSource.swift
//  News
//
//  Created by Agung Tri Utomo on 02/12/21.
//

import Foundation
import RealmSwift
import Combine

protocol LocaleDataSourceProocol: AnyObject {
    func getArticles() -> AnyPublisher<[ArticleEntity], Error>
    func getBookmarkedArticle(from articleId: String) -> AnyPublisher<Bool, Error>
    func addBookmarkArticle(from article: ArticleEntity) -> AnyPublisher<Bool, Error>
    func deleteBookmarkArticle(from articleId: String) -> AnyPublisher<Bool, Error>
}

final class LocaleDataSource: NSObject {
    private let realm: Realm?
    private init(realm: Realm?) {
        self.realm = realm
    }
    static let sharedInstance: (Realm?) -> LocaleDataSource = { realmDatabase in
        return LocaleDataSource(realm: realmDatabase)
    }
}

extension LocaleDataSource: LocaleDataSourceProocol {
    func getArticles() -> AnyPublisher<[ArticleEntity], Error> {
        return Future<[ArticleEntity], Error> { completion in
            if let realm = self.realm {
                let articles: Results<ArticleEntity> = {
                    realm.objects(ArticleEntity.self).sorted(byKeyPath: "id", ascending: false)
                }()
                completion(.success(articles.toArray(ofType: ArticleEntity.self)))
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
    func getBookmarkedArticle(from articleId: String) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { completion in
            if let realm = self.realm {
                do {
                    if let result = realm.object(ofType: ArticleEntity.self, forPrimaryKey: articleId) {
                        completion(.success(!result.id.isEmpty))
                    } else {
                        completion(.failure(DatabaseError.requestFailed))
                    }
                }
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
    func addBookmarkArticle(from article: ArticleEntity) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { completion in
            if let realm = self.realm {
                do {
                    try realm.write {
                        realm.add(article, update: .all)
                        completion(.success(true))
                    }
                } catch {
                    completion(.failure(DatabaseError.requestFailed))
                }
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
    func deleteBookmarkArticle(from articleId: String) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { completion in
            if let realm = self.realm {
                do {
                    try realm.write {
                        realm.delete(realm.object(ofType: ArticleEntity.self, forPrimaryKey: articleId)!)
                        completion(.success(true))
                    }
                } catch {
                    completion(.failure(DatabaseError.requestFailed))
                }
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
}

extension Results {
    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for index in 0 ..< count {
            if let result = self[index] as? T {
                array.append(result)
            }
        }
        return array
    }
}
