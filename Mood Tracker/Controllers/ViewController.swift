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
    
    @IBAction func unwindToHome(_ segue: UIStoryboardSegue) {
        guard let identifier = segue.identifier else {
            return
        }
        guard let destVC = segue.source as? MoodDetailViewController else {
            return print("storyboard unwind segue not set up correctly")
        }
        
        switch identifier {
        case "unwind from save":
            if destVC.isEditingEntry {
                print("from save button and editing an existing entry")
            } else {
                print("from save button and adding a new entry")
            }
        case "unwind from cancel":
            print("from cancel button")
        default:
            break
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
        
        cell.moodLabel.text = entry.mood.stringValue
        cell.dateLabel.text = String(describing: entry.date)
        cell.imgViewMoodColor.backgroundColor = entry.mood.colorValue
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedEntry = entries[indexPath.row]
        print("The mood you clicked on is \(selectedEntry.mood.stringValue)")
    }
}

