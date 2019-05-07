//
//  MoodDetailViewController.swift
//  Mood Tracker
//
//  Created by Johan Park on 5/7/19.
//  Copyright © 2019 Johan Park. All rights reserved.
//

import UIKit

class MoodDetailViewController: UIViewController {
    
    var mood: MoodEntry.Mood!
    var date: Date!
    
    @IBOutlet weak var amazingButton: UIButton!
    @IBOutlet weak var goodButton: UIButton!
    @IBOutlet weak var neutralButton: UIButton!
    @IBOutlet weak var badButton: UIButton!
    @IBOutlet weak var terribleButton: UIButton!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    private func updateUI() {
        updateMood(to: mood)
        datePicker.date = date
    }
    
    private func updateMood(to newMood: MoodEntry.Mood) {
        let unselectedColor = UIColor.lightGray
        switch newMood {
        case .none:
            amazingButton.backgroundColor = unselectedColor
            goodButton.backgroundColor = unselectedColor
            neutralButton.backgroundColor = unselectedColor
            badButton.backgroundColor = unselectedColor
            terribleButton.backgroundColor = unselectedColor
        case .amazing:
            amazingButton.backgroundColor = newMood.colorValue
            goodButton.backgroundColor = unselectedColor
            neutralButton.backgroundColor = unselectedColor
            badButton.backgroundColor = unselectedColor
            terribleButton.backgroundColor = unselectedColor
        case .good:
            amazingButton.backgroundColor = unselectedColor
            goodButton.backgroundColor = newMood.colorValue
            neutralButton.backgroundColor = unselectedColor
            badButton.backgroundColor = unselectedColor
            terribleButton.backgroundColor = unselectedColor
        case .neutral:
            amazingButton.backgroundColor = unselectedColor
            goodButton.backgroundColor = unselectedColor
            neutralButton.backgroundColor = newMood.colorValue
            badButton.backgroundColor = unselectedColor
            terribleButton.backgroundColor = unselectedColor
        case .bad:
            amazingButton.backgroundColor = unselectedColor
            goodButton.backgroundColor = unselectedColor
            neutralButton.backgroundColor = unselectedColor
            badButton.backgroundColor = newMood.colorValue
            terribleButton.backgroundColor = unselectedColor
        case .terrible:
            amazingButton.backgroundColor = unselectedColor
            goodButton.backgroundColor = unselectedColor
            neutralButton.backgroundColor = unselectedColor
            badButton.backgroundColor = unselectedColor
            terribleButton.backgroundColor = newMood.colorValue
        }
        mood = newMood
    }
    
    @IBAction func pressCancel(_ sender: UIBarButtonItem) {
        
    }
    
    @IBAction func pressSave(_ sender: UIBarButtonItem) {
        
    }
    
    @IBAction func pressMood(_ button: UIButton) {
        switch button.tag {
        case 0:
            updateMood(to: .amazing)
        case 1:
            updateMood(to: .good)
        case 2:
            updateMood(to: .neutral)
        case 3:
            updateMood(to: .bad)
        case 4:
            updateMood(to: .terrible)
        default:
            print("error")
        }
    }
    
    @IBAction func datePickerDidChangeValue(_ sender: UIDatePicker) {
        date = datePicker.date
    }
}
