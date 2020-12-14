//
//  Company+CoreDataClass.swift
//  Homework8
//
//  Created by Uzver on 14.12.2020.
//
//

import UIKit
import CoreData

@objc(Company)
public class Company: NSManagedObject {
	var workers: [Worker]? {
		return self.rawWorker?.array as? [Worker]
	}
	convenience init?(name: String) {
		let appDelegate = UIApplication.shared.delegate as? AppDelegate

		guard let context = appDelegate?.persistentContainer.viewContext else { return nil }
		self.init(entity: Company.entity(), insertInto: context)
		self.name = name
	}
}
