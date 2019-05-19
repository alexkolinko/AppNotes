//
//  NotesTableViewController.swift
//  AppNotes
//
//  Created by Alexandr on 5/19/19.
//  Copyright © 2019 Alex Kolinko. All rights reserved.
//

import UIKit
import RealmSwift

class NotesTableViewController: UITableViewController {
    
    @IBOutlet var notesTable: UITableView!
    @IBOutlet weak var addNote: UIBarButtonItem!
    let realmManager = RealmManager()
    let realm = try! Realm()
    var notes: Results<NoteList>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notes = realm.objects(NoteList.self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard notes.count != 0 else {return 0}
        return notes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "note") as! NoteTableViewCell
        let note = notes[indexPath.row]
        cell.noteLabel.text = note.note
        cell.dateLabel.text = note.date
        cell.timeLabel.text = note.time
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let  editingRow = notes[indexPath.row]
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete") { (_, _) in
            self.realmManager.deleteObject(objs: editingRow)
            tableView.reloadData()
        }
        return [deleteAction]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "viewItem" else {return}
        guard let destination = segue.destination as? EditViewController else {return}
        let selectedItem = notesTable.indexPathForSelectedRow!.row
        let arrayIndex = selectedItem
        destination.arrayIndex = arrayIndex
    }
    @IBAction func sorted(_ sender: UIBarButtonItem) {
        let sortedAlert = UIAlertController(title: "Сортировка", message: "Сортитровать по:", preferredStyle: .actionSheet)
        let sortedName = UIAlertAction(title: "Алфавит", style: .default) { (sortedAlert: UIAlertAction) in self.notes = self.notes.sorted(byKeyPath: "note"); self.tableView.reloadData()}
        let sortedDate = UIAlertAction(title: "Дата", style: .default) { (sortedAlert: UIAlertAction) in self.notes = self.notes.sorted(byKeyPath: "date"); self.tableView.reloadData()}
        sortedAlert.addAction(sortedName)
        sortedAlert.addAction(sortedDate)
        self.present(sortedAlert, animated: true, completion: nil)
    }
    
    @IBAction func unwindToFirstViewController(segue: UIStoryboardSegue){
        
    }
}
