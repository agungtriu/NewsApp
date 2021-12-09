//
//  File.swift
//  
//
//  Created by Agung Tri Utomo on 08/12/21.
//

import Core
import Combine
import RealmSwift
import Foundation
 
 
public struct GetArticlesLocaleDataSource: LocaleDataSource {
    public typealias Request = Any
    public typealias Response = ArticleModuleEntity
    private let _realm: Realm
    public init(realm: Realm) {
        _realm = realm
    }
    public func list(request: Any?) -> AnyPublisher<[ArticleModuleEntity], Error> {
        return Future<[ArticleModuleEntity], Error> { completion in
            let articles: Results<ArticleModuleEntity> = {
              _realm.objects(ArticleModuleEntity.self)
                .sorted(byKeyPath: "id", ascending: false)
            }()
            completion(.success(articles.toArray(ofType: ArticleModuleEntity.self)))
          
        }.eraseToAnyPublisher()
    }
    public func add(entity: ArticleModuleEntity) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { completion in
            do {
                try _realm.write {
                    _realm.add(entity, update: .all)
                    completion(.success(true))
                }
            } catch {
                completion(.failure(DatabaseError.requestFailed))
            }
            
        }.eraseToAnyPublisher()
    }
    public func get(id: String) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { completion in
            do {
                if let result = _realm.object(ofType: ArticleModuleEntity.self, forPrimaryKey: id) {
                    completion(.success(!result.id.isEmpty))
                } else {
                    completion(.failure(DatabaseError.requestFailed))
                }
            }
        }.eraseToAnyPublisher()
    }
    public func delete(id: String) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { completion in
            do {
                try _realm.write {
                    _realm.delete(_realm.object(ofType: ArticleModuleEntity.self, forPrimaryKey: id)!)
                    completion(.success(true))
                }
            } catch {
                completion(.failure(DatabaseError.requestFailed))
            }
        }.eraseToAnyPublisher()
    }
}
