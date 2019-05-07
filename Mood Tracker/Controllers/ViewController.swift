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
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addEntry))
        
        let goodEntry = MoodEntry(mood: .good, date: Date())
        let badEntry = MoodEntry(mood: .bad, date: Date())
        let neutralEntry = MoodEntry(mood: .neutral, date: Date())
        let otherEntry = MoodEntry(mood: .amazing, date: Date())
        
        entries = [goodEntry, badEntry, neutralEntry, otherEntry]
        tableView.reloadData()
    }

    @objc func addEntry() {
        let now = Date()
        let entry = MoodEntry(mood: .terrible, date: now)
        entries.insert(entry, at: 0)
        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier {
            case "show entry details":
                guard
                    let selectedCell = sender as? MoodEntryTableViewCell,
                    let indexPath = tableView.indexPath(for: selectedCell) else {
                        return print("failed to locate index path from sender")
                }
                
                guard let destVC = segue.destination as? MoodDetailViewController
                    else {return print("storyboard not set up correctly")}
                
                let entry = entries[indexPath.row]
                destVC.mood = entry.mood
                destVC.date = entry.date
                
            default: break
            }
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

