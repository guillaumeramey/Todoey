//
//  Category.swift
//  Todoey
//
//  Created by Guillaume Ramey on 30/12/2018.
//  Copyright © 2018 Guillaume Ramey. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name = ""
    let items = List<Item>()
}
