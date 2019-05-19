//
//  EditViewController.swift
//  AppNotes
//
//  Created by Alexandr on 5/19/19.
//  Copyright © 2019 Alex Kolinko. All rights reserved.
//

import UIKit
import RealmSwift

class EditViewController: UIViewController {
    
    @IBOutlet weak var viewNote: UITextView!
    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBOutlet weak var shareButton: UITextView!
    let realmManager = RealmManager()
    let dateAndTime = DateAndTime()
    let realm = try! Realm()
    var notes: Results<NoteList>!
    var arrayIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notes = realm.objects(NoteList.self)
        let note = notes[arrayIndex]
        viewNote.text = note.note
    }
    
    @IBAction func pressEdit(_ sender: UIBarButtonItem) {
        if editButton.title == "Редактировать" {
            editButton.title = "Сохранить"
            viewNote.isEditable = true
            viewNote.becomeFirstResponder()
        } else {
            editButton.title = "Сохранить"
            viewNote.isEditable = false
            viewNote.resignFirstResponder()
            if viewNote.text == "Редактировать" {
                let note = notes[arrayIndex]
                self.realmManager.deleteObject(objs: note)
            } else {
                let note = notes[arrayIndex]
                try! self.realm.write {
                    note.note = viewNote.text
                    note.date = dateAndTime.date()
                    note.time = dateAndTime.time()
                }
            }
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func pressedShare(_ sender: UIBarButtonItem) {
        let activityVC = UIActivityViewController(activityItems: [viewNote.text!], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
    }
}
