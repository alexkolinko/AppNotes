//
//  SaveViewController.swift
//  AppNotes
//
//  Created by Alexandr on 5/19/19.
//  Copyright © 2019 Alex Kolinko. All rights reserved.
//

import UIKit
import RealmSwift

class SaveNoteViewController: UIViewController {
    
    @IBOutlet weak var inputTxt: UITextView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    let realmManager = RealmManager()
    let dateAndTime = DateAndTime()
    let note = NoteList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTxt.becomeFirstResponder()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let text = inputTxt.text, text != "" else {return}
        self.note.note = text
        self.note.date = dateAndTime.date()
        self.note.time = dateAndTime.time()
        self.realmManager.saveObjects(objs: note)
        
    }
}

