//
//  main.swift
//  FokusStartHomeWorks
//
//  Created by Я on 16/10/2020.
//  Copyright © 2020 HomeMade. All rights reserved.
//

import Foundation

var autoCatalog: Array<Car> = []
let printing = Functions()

while true {
	printing.menu()
	
	guard let input = Int(readLine() ?? "") else { break }
	
	switch input {
	case 1 :
		printing.chooseBody()
	case 2 :
		printing.listAddedCars()
	case 3 :
		printing.catalog()
		printing.addedCarsFilter()
	case 4:
		exit(0)
	default :
		break
	}
	print("Вы ввели недопустимое число, попробуйте снова")
}

