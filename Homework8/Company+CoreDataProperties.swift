//
//  Company+CoreDataProperties.swift
//  Homework8
//
//  Created by Uzver on 14.12.2020.
//
//

import Foundation
import CoreData


extension Company {

	@nonobjc public class func fetchRequest() -> NSFetchRequest<Company> {
		return NSFetchRequest<Company>(entityName: "Company")
	}

	@NSManaged public var name: String?
	@NSManaged public var rawWorker: NSOrderedSet?

}

// MARK: Generated accessors for rawWorker
extension Company {

	@objc(insertObject:inRawWorkerAtIndex:)
	@NSManaged public func insertIntoRawWorker(_ value: Worker, at idx: Int)

	@objc(removeObjectFromRawWorkerAtIndex:)
	@NSManaged public func removeFromRawWorker(at idx: Int)

	@objc(insertRawWorker:atIndexes:)
	@NSManaged public func insertIntoRawWorker(_ values: [Worker], at indexes: NSIndexSet)

	@objc(removeRawWorkerAtIndexes:)
	@NSManaged public func removeFromRawWorker(at indexes: NSIndexSet)

	@objc(replaceObjectInRawWorkerAtIndex:withObject:)
	@NSManaged public func replaceRawWorker(at idx: Int, with value: Worker)

	@objc(replaceRawWorkerAtIndexes:withRawWorker:)
	@NSManaged public func replaceRawWorker(at indexes: NSIndexSet, with values: [Worker])

	@objc(addRawWorkerObject:)
	@NSManaged public func addToRawWorker(_ value: Worker)

	@objc(removeRawWorkerObject:)
	@NSManaged public func removeFromRawWorker(_ value: Worker)

	@objc(addRawWorker:)
	@NSManaged public func addToRawWorker(_ values: NSOrderedSet)

	@objc(removeRawWorker:)
	@NSManaged public func removeFromRawWorker(_ values: NSOrderedSet)

}

extension Company : Identifiable {

}
