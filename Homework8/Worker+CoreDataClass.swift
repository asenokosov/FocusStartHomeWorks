//
//  Worker+CoreDataClass.swift
//  Homework8
//
//  Created by Uzver on 14.12.2020.
//
//

import UIKit
import CoreData

@objc(Worker)
public class Worker: NSManagedObject {
	convenience init?(name: String, age: String, workExperience: String, education: String?, post: String?) {
		let appDelegate = UIApplication.shared.delegate as? AppDelegate
		guard let context = appDelegate?.persistentContainer.viewContext else {  print("error"); return nil }

		self.init(entity: Worker.entity(), insertInto: context)
		self.name = name
		self.age = age
		self.workExperience = workExperience
		self.education = education
		self.post = post
	}
}
