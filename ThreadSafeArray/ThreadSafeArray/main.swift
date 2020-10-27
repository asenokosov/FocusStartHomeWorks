//
//  main.swift
//  ThreadSafeArray
//
//  Created by Uzver on 27.10.2020.
//

import Foundation

var array1 = ThreadSafeArray<Any>()
var array2 = [Int]()

let group = DispatchGroup()

group.enter()

DispatchQueue.global(qos: .userInteractive).async {
	for i in 1...1000 {
		array1.appendTSA(i)
		print("Выполняю потокобезопасный")
	}
	group.leave()
}

group.enter()

DispatchQueue.global(qos: .userInteractive).async {
	for i in 1...1000 {
		array2.append(i)
		print("Выполняю обычный массив")
	}
	group.leave()
}
group.wait()

print(array1.count)
print(array2.count)
