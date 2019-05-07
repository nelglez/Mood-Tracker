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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(mood, date)
    }
}
