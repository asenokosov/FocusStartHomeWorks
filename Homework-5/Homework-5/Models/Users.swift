//
//  Users.swift
//  Homework-5
//
//  Created by Uzver on 19.11.2020.
//

import Foundation
import Firebase

struct Users {
	let uid: String
	let email: String

	init(user: User) {
		self.uid = user.uid
		self.email = user.email!
}
}
