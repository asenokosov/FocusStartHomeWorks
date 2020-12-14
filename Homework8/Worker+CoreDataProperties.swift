//
//  Worker+CoreDataProperties.swift
//  Homework8
//
//  Created by Uzver on 14.12.2020.
//
//

import Foundation
import CoreData


extension Worker {

	@nonobjc public class func fetchRequest() -> NSFetchRequest<Worker> {
		return NSFetchRequest<Worker>(entityName: "Worker")
	}

	@NSManaged public var age: String?
	@NSManaged public var education: String?
	@NSManaged public var name: String?
	@NSManaged public var post: String?
	@NSManaged public var workExperience: String?
	@NSManaged public var company: Company?

}

extension Worker : Identifiable {

}
