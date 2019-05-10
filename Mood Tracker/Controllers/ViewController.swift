//
//  ViewController.swift
//  Mood Tracker
//
//  Created by Johan Park on 5/7/19.
//  Copyright © 2019 Johan Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var entries: [MoodEntry] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let goodEntry = MoodEntry(mood: .good, date: Date())
        let badEntry = MoodEntry(mood: .bad, date: Date())
        let neutralEntry = MoodEntry(mood: .neutral, date: Date())
        let otherEntry = MoodEntry(mood: .amazing, date: Date())
        
        entries = [goodEntry, badEntry, neutralEntry, otherEntry]
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier {
            case "show new entry":
                guard let destVC = segue.destination as? MoodDetailViewController
                    else {return print("storyboard not set up correctly")}
                
                destVC.mood = MoodEntry.Mood.none
                destVC.date = Date()
                
            case "show entry details":
                guard
                    let selectedCell = sender as? MoodEntryTableViewCell,
                    let indexPath = tableView.indexPath(for: selectedCell) else {return print("failed to locate index path from sender")}
                
                guard let destVC = segue.destination as? MoodDetailViewController
                    else {return print("storyboard not set up correctly")}
                
                let entry = entries[indexPath.row]
                destVC.mood = entry.mood
                destVC.date = entry.date
                destVC.isEditingEntry = true
                
            default: break
            }
        }
    }
    
    func createEntry(mood: MoodEntry.Mood, date: Date) {
        let newEntry = MoodEntry(mood: mood, date: date)
        entries.insert(newEntry, at: 0)
        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
    }
    
    func updateEntry(mood: MoodEntry.Mood, date: Date, at index: Int) {
        entries[index].mood = mood
        entries[index].date = date
        tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
    }
    
    func deleteEntry(at index: Int) {
        entries.remove(at: index)
        tableView.deleteRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
    }
    
    @IBAction func pressCalender(_ sender: UIBarButtonItem) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let calenderVC = mainStoryboard.instantiateViewController(withIdentifier: "calender vc") as? CalenderViewController else {
            return print("could not set up correctly.")
        }
        present(calenderVC, animated: true, completion: nil)
    }
    
    @IBAction func unwindToHome(_ segue: UIStoryboardSegue) {
        guard let identifier = segue.identifier else {
            return
        }
        guard let destVC = segue.source as? MoodDetailViewController else {
            return print("storyboard unwind segue not set up correctly")
        }
        
        switch identifier {
        case "unwind from save":
            let newMood: MoodEntry.Mood = destVC.mood
            let newDate: Date = destVC.date
            if destVC.isEditingEntry {
                guard let selectedIndexPath = tableView.indexPathForSelectedRow else { return }
                updateEntry(mood: newMood, date: newDate, at: selectedIndexPath.row)
                print("from save button and editing an existing entry")
            } else {
                createEntry(mood: newMood, date: newDate)
                print("from save button and adding a new entry")
            }
        case "unwind from cancel":
            print("from cancel button")
        default:
            break
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: selectedIndexPath, animated: true)
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mood cell entry", for: indexPath) as! MoodEntryTableViewCell
        
        let entry = entries[indexPath.row]
        cell.configure(entry)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedEntry = entries[indexPath.row]
        print("The mood you clicked on is \(selectedEntry.mood.stringValue)")
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            deleteEntry(at: indexPath.row)
        default:
            break
        }
    }
}

