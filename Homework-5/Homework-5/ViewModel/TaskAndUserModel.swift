//
//  TaskAndUserModel.swift
//  Homework-5
//
//  Created by Uzver on 20.11.2020.
//

import Foundation
import Firebase

struct TaskAndUserModel {

	let title: String
	let userID: String
	let ref: DatabaseReference?
	var completed: Bool

	init (model: Tasks) {
		self.title = model.title
		self.userID = model.userID
		self.ref = nil
		self.completed = false
	}

	init(snapshot: DataSnapshot) {
		let snapshotValue = snapshot.value as! [String: AnyObject]
		title = snapshotValue["title"] as! String
		userID = snapshotValue["userID"] as! String
		ref = snapshot.ref
		completed = snapshotValue["completed"] as! Bool
}
	
}
