//
//  Date+String.swift
//  Mood Tracker
//
//  Created by Johan Park on 5/10/19.
//  Copyright © 2019 Johan Park. All rights reserved.
//

import Foundation

extension Date {
    var stringValue: String {
        return DateFormatter.localizedString(from: self, dateStyle: .medium, timeStyle: .short)
    }
}
