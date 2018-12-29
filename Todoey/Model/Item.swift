//
//  Item.swift
//  Todoey
//
//  Created by Guillaume Ramey on 29/12/2018.
//  Copyright © 2018 Guillaume Ramey. All rights reserved.
//

import Foundation

class Item {
    var title: String
    var done = false

    init(_ title: String) {
        self.title = title
    }
}
