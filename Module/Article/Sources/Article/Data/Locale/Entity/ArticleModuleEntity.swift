//
//  File.swift
//  
//
//  Created by Agung Tri Utomo on 08/12/21.
//

import Foundation
import RealmSwift
public class ArticleModuleEntity: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var source: String = ""
    @objc dynamic var author: String = ""
    @objc dynamic var title: String = ""
    @objc dynamic var desc: String = ""
    @objc dynamic var url: String = ""
    @objc dynamic var urlToImage: String = ""
    @objc dynamic var publishedAt: String = ""
    @objc dynamic var content: String = ""
    public override static func primaryKey() -> String? {
        return "id"
    }
}
