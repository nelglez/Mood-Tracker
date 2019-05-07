//
//  MoodEntry.swift
//  Mood Tracker
//
//  Created by Johan Park on 5/7/19.
//  Copyright © 2019 Johan Park. All rights reserved.
//

import Foundation
import UIKit.UIColor

struct MoodEntry {
    var mood: Mood
    var date: Date
    
    enum Mood {
        case none
        case amazing
        case good
        case neutral
        case bad
        case terrible
        
        var stringValue: String {
            switch self {
            case .none:
                return ""
            case .amazing:
                return "Amazing"
            case .good:
                return "Good"
            case .neutral:
                return "Neutral"
            case .bad:
                return "Bad"
            case .terrible:
                return "Terrible"
            }
        }
        
        var colorValue: UIColor {
            switch self {
            case .none:
                return .clear
            case .amazing:
                return .green
            case .good:
                return .blue
            case .neutral:
                return .gray
            case .bad:
                return .orange
            case .terrible:
                return .red
            }
        }
    }
}
