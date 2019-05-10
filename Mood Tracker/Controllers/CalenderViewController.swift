//
//  CalenderViewController.swift
//  Mood Tracker
//
//  Created by Johan Park on 5/9/19.
//  Copyright © 2019 Johan Park. All rights reserved.
//

import UIKit
import Foundation

class CalenderViewController: UIViewController {
    
    @IBAction func donePressed(_ sender: UIButton) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
