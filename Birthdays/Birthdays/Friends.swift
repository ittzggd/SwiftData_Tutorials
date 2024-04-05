//
//  Friends.swift
//  Birthdays
//
//  Created by Katherine JANG on 4/5/24.
//

import Foundation
import SwiftData

/// @Model macro requires class instead of struct
/// A class and a struct both hold data,
/// but instances of a class have a "built-in identity" that struct don't have
@Model
class Friend {
	let name: String
	let birthday: Date
	
	init(name: String, birthday: Date) {
		self.name = name
		self.birthday = birthday
	}
	
	var isBirthdayToday: Bool {
		Calendar.current.isDateInToday(birthday)
	}
}


// MARK: - before import SwiftData

//struct Friend {
//	let name: String
//	let birthday: Date
//}
