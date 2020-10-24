//  main.swift
//  FokusStartHomeWorks
//
//  Created by Я on 16/10/2020.
//  Copyright © 2020 HomeMade. All rights reserved.
//
var autoCatalog: Array<Car> = []

while true {
    print(" 1 - Добавление нового автомобиля", "\n", "2 - Вывод списка добавленных автомобилей", "\n", "3 - Вывод списка автомобилей с использованием фильтра по типу кузова автомобиля", "\n")
    
    let input = Int(readLine()!)
    
    if input == 1 {
        var car = Car()
        print("Введите производителя авто")
        car.manufacturer = readLine()!
        print("Введите модель авто")
        car.model = readLine()!
        print("Введите год выпуска")
        car.yearOfIssue = readLine()!
        print("Введите цифру, соответсвующую типу корпуса:", "\n", "1 - Hatchback", "\n", "2 - Sedan", "\n", "любой другой ввод - Нет подходящего типа")
        let input2 = Int(readLine()!)
        if input2 == 1 {car.body = .Hatchback}
        else if input2 == 2 {car.body = .Sedan}
        //car.body.self = readLine()!.lowercased()
        autoCatalog.append(car)
    } else if input == 2 {
        if autoCatalog.isEmpty {print("Список пуст")}
        else{
            for car in autoCatalog {
                print("Производитель: \(car.manufacturer), Модель: \(car.model), тип корпуса: \(car.body), год выпуска: \(car.yearOfIssue)", "\n")
            }
        }
    } else if input == 3 {
        print("Введите цифру, соответсвующую типу корпуса для фильтрации:", "\n", "1 - Hatchback", "\n", "2 - Sedan", "\n",  "любой другой ввод - Нет подходящего типа", "\n")
        let input3 = Int(readLine()!)
        var x:Body
        if input3 == 1 {x = .Hatchback}
        else if input3 == 2 {x = .Sedan}
        else {x = .Unknown}
        for car in autoCatalog {
            if car.body == x {print("Производитель: \(car.manufacturer), Модель: \(car.model), тип корпуса: \(car.body), Гос номер: \(car.carNumber)", "\n")}
        }
    } else {
        print("Вы ввели недопустимое число, попробуйте снова")
    }
}




