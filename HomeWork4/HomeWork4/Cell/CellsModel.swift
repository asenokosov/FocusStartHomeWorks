//
//  CellsModel.swift
//  HomeWork4
//
//  Created by Uzver on 06.11.2020.
//

import Foundation
import UIKit

struct CellsModel {
	var imageFirst: UIImage
	var secondImage: UIImage
	var headingNews: String
	var textNews: String
	var smallDescription: String

	static func cellWithNews() -> [CellsModel] {
		let cellOne = CellsModel(imageFirst: UIImage(named: "andrew")!, secondImage: UIImage(named: "bence")!,
								 headingNews: "Текст первого заголовка!", textNews: "Все детали внутри!", smallDescription: "Он любил и страдал. Он любил деньги и страдал от их недостатка")
		let cellTwo = CellsModel(imageFirst: UIImage(named: "casey")!, secondImage: UIImage(named: "chuttersnap")!, headingNews: "Внимание! Внимание! Внимание! Говорит Германия! Сегодня под мостом...", textNews: "Подробности внутри!", smallDescription: "Поймали Гитлера с хвостом!")
		let cellThree = CellsModel(imageFirst: UIImage(named: "david")!, secondImage: UIImage(named: "eberhard")!, headingNews: "Для того что б избавиться от...", textNews: "Вам нужно всего лишь один раз каждое утро...", smallDescription: "Если человек тебе сделал ЗЛО — ты дай ему конфетку, он тебе ЗЛО — ты ему конфетку... И так до тех пор, пока у этой твари не разовьётся сахарный диабет. Если женщина говорит мужчине, что он самый умный, значит, она понимает, что второго такого дурака она не найдет")
		let cellFour = CellsModel(imageFirst: UIImage(named: "hussainh")!, secondImage: UIImage(named: "ibrahimh")!, headingNews: "Лёд сбил самолёт с неба", textNews: "Эту бредовую новость я взял с инета", smallDescription: "Ипполит Матвеевич, почти плача, взбежал на пароход. Вот это ваш мальчик? – спросил завхоз подозрительно. Мальчик, сказал Остап, разве плох? Типичный мальчик. Кто скажет, что это девочка, пусть первый бросит в меня камень!")
		let cellFive = CellsModel(imageFirst: UIImage(named: "jos")!, secondImage: UIImage(named: "leioash")!, headingNews: "Роскосмос запускает грузовик", textNews: "", smallDescription: "молодец что дооткрывал, тут просто текст для теста")
		return [cellOne, cellTwo, cellThree, cellFour, cellFive]
	}
}
