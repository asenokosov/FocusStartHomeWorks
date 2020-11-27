//
//  StructSafeArray.swift
//  ThreadSafeArray
//
//  Created by Uzver on 27.10.2020.
//

import Foundation

public class ThreadSafeArray<Element> {

	private var saveArray = [Element]()
	private let queue = DispatchQueue(label: "FokusStart.HomeWork2", attributes: .concurrent)
}

//MARK: Обязательные методы:

extension ThreadSafeArray {

	func append(_ element: Element){
		queue.async(flags: .barrier) {
			self.saveArray.append(element)
		}
	}

	func remove(at index: Int){
		queue.async(flags: .barrier) {
			guard self.saveArray.isEmpty == false else { return print("Данный массив пуст и удалять просто нечего") }
			self.saveArray.remove(at: index)
		}
	}

	subscript(index: Int) -> Element? {
		get {
			var result: Element?
			queue.async {
				guard self.saveArray.indices.contains(index) else { return }
				result = self.saveArray[index]
			}
			return result
		}
		// В задании действие: "Возвращает элемент с указанным индексом. Про получение речи не было..."

		//		set {
		//			asyncQueue.async(flags: .barrier) {
		//				guard let newValue = newValue else { return }
		//				self.saveArray[index] = newValue
		//			}
		//		}
	}
}

//MARK: Обязательное свойство contains

extension ThreadSafeArray where Element: Equatable {

	func contains(_ element: Element) -> Bool {
		return queue.sync {
			self.saveArray.contains(element)
		}
	}
}

//MARK: Обязательные свойства:

extension ThreadSafeArray {

	var isEmpty: Bool {
		var result = false
		queue.sync {
			result = self.saveArray.isEmpty
		}
		return result
	}

	var count: Int {
		var result = 0
		queue.sync {
			result = self.saveArray.count
		}
		return result
	}
}
