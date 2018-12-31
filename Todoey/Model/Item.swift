//
//  Item.swift
//  Todoey
//
//  Created by Guillaume Ramey on 30/12/2018.
//  Copyright © 2018 Guillaume Ramey. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title = ""
    @objc dynamic var done = false
    @objc dynamic var dateCreated = Date()
    var parentCategory = LinkingObjects.init(fromType: Category.self, property: "items")
}
