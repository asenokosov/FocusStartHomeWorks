//
//  Func.swift
//  FokusStartHomeWorks
//
//  Created by Uzver on 21.11.2020.
//  Copyright © 2020 HomeMade. All rights reserved.
//

import Foundation

class Functions {

	let	errorMessage = "Введите корректное значение"
	
	func menu () {
		return print(" 1 - Добавление нового автомобиля", "\n", "2 - Вывод списка добавленных автомобилей", "\n", "3 - Вывод списка автомобилей с использованием фильтра по типу кузова автомобиля", "\n", "4 - Завершите программу", "\n")
	}
	
	func catalog() {
		return print("Введите цифру, соответсвующую типу корпуса для фильтрации:", "\n", "1 - Хэтчбэк", "\n", "2 - Седан", "\n",  "любой другой ввод - Нет подходящего типа", "\n")
	}
	
	func chooseBody() {
		var car = Car(manufacturer: "", model: "", body: .Unknown)
		
		print("Введите производителя авто")
		car.manufacturer = self.checkString()
		
		print("Введите модель авто")
		car.model = self.checkString()
		
		print("Введите цифру, соответсвующую типу корпуса:", "\n", "1 - Хэтчбэк", "\n", "2 - Седан", "\n", "любой другой ввод - Нет подходящего типа")

		let carBody = self.checkInt()
		if carBody == 1 {car.body = .Hatchback}
		else if carBody == 2 {car.body = .Sedan}
		
		print("Введите год выпуска или нажмите Enter")
		car.yearOfIssue = readInt()
		
		print("Введите гос.номер или нажмите Enter")
		car.carNumber = readLine()
		autoCatalog.append(car)
		
		return
	}
	
	func result(_ car: Car) {
		print("Производитель: \(car.manufacturer)")
		print("Модель: \(car.model)")
		print("Тип корпуса: \(car.body.rawValue)")
		print("Год выпуска: \(car.yearOfIssue?.description ?? "-")")
		if let carNumber = car.carNumber {
			print("Гос.номер: \(carNumber)")
		}
	}
	
	func listAddedCars() {
		if autoCatalog.isEmpty {print("Список пуст")}
		else{
			autoCatalog.forEach{ self.result($0)}
		}
	}
	
	func addedCarsFilter() {

		if let carBody = Int(readLine() ?? "") {
			var selectedBody:Body
			if carBody == 1 {selectedBody = .Hatchback}
			else if carBody == 2 {selectedBody = .Sedan}
			else {selectedBody = .Unknown}
			for _ in autoCatalog {
				autoCatalog.filter{$0.body == selectedBody}.forEach{ self.result($0)}

			}
		} else {
			return
		}
	}
	
	func checkString() -> String {
		var writeString = ""
		while writeString.isEmpty {
			if let string = readLine(),
			   string.isEmpty == false {
				writeString = string
			}
			else {

				print(errorMessage)

			}
		}
		return writeString
	}
	
	func checkInt() -> Int {
		var writeInt: Int?
		while writeInt == nil {
			let writeString = self.checkString()
			if let int = Int(writeString) {
				writeInt = int
			} else {
				print(errorMessage)
			}
		}
		return writeInt ?? 0
	}
	
	func readInt() -> Int? {
		let writeString = readLine()
		if writeString?.isEmpty ?? true { return nil }
		guard let writeInt = Int(writeString ?? "") else {
			print(errorMessage)
			return self.readInt()
		}
		return writeInt
	}
}

