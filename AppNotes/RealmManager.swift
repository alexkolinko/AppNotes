//
//  RealmManager.swift
//  AppNotes
//
//  Created by Alexandr on 5/19/19.
//  Copyright © 2019 Alex Kolinko. All rights reserved.
//

import Foundation
import RealmSwift

class RealmManager {
    
    let realm = try? Realm()
    
    func saveObjects(objs: Object) {
        try? realm!.write {
            realm?.add(objs)
        }
    }
    
    func deleteObject(objs : Object) {
        try? realm!.write {
            realm?.delete(objs)
        }
    }
}
