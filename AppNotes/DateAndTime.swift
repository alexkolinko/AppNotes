//
//  DateAndTime.swift
//  AppNotes
//
//  Created by Alexandr on 5/19/19.
//  Copyright © 2019 Alex Kolinko. All rights reserved.
//

import Foundation

class DateAndTime {
    
    func date() -> String {
        let todaysDate = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let DateInFormat = dateFormatter.string(from: todaysDate as Date)
        return DateInFormat
    }
    
    func time() -> String {
        let todaysDate = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let DateInFormat = dateFormatter.string(from: todaysDate as Date)
        return DateInFormat
    }
}

