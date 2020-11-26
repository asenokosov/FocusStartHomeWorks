//
//  Tasks.swift
//  Homework-5
//
//  Created by Uzver on 19.11.2020.
//

import Foundation
import Firebase

struct Tasks {
	let title: String
	let userID: String
	let ref: DatabaseReference?
	var completed: Bool
}
