//
//  TaskAndUserModel.swift
//  Homework-5
//
//  Created by Uzver on 20.11.2020.
//

import Foundation
import Firebase

class TaskAndUserModel {

	struct Tasks {

		let title: String
		let userID: String
		let ref: DatabaseReference?
		var completed: Bool

		init (title: String, userID: String) {
			self.title = title
			self.userID = userID
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

	struct Users {
		let uid: String
		let email: String

		init(user: User) {
			self.uid = user.uid
			self.email = user.email!
		}
	}
}
