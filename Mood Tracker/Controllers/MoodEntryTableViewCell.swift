//
//  MoodEntryTableViewCell.swift
//  Mood Tracker
//
//  Created by Johan Park on 5/7/19.
//  Copyright © 2019 Johan Park. All rights reserved.
//

import UIKit

class MoodEntryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var moodLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var imgViewMoodColor: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(_ entry: MoodEntry) {
        imgViewMoodColor.backgroundColor = entry.mood.colorValue
        moodLabel.text = entry.mood.stringValue
        dateLabel.text = entry.date.stringValue
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
