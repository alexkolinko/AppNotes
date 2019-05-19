//
//  NoteList.swift
//  AppNotes
//
//  Created by Alexandr on 5/19/19.
//  Copyright © 2019 Alex Kolinko. All rights reserved.
//

import UIKit
import RealmSwift

class NoteList: Object {
    @objc dynamic var note = ""
    @objc dynamic var date = ""
    @objc dynamic var time = ""
}
