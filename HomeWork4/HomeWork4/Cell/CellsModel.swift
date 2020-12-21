//
//  CellsModel.swift
//  HomeWork4
//
//  Created by Uzver on 06.11.2020.
//

import Foundation
import UIKit

struct CellsModel {
	let imageFirst: UIImage
	let secondImage: UIImage
	let headingNews: String
	let textNews: String
	let smallDescription: String

	static func cellWithNews() -> [CellsModel] {
		let cellOne = CellsModel(imageFirst: UIImage.assign.first.images, secondImage: UIImage.assign.second.images, headingNews: "Текст первого заголовка!", textNews: "Все детали внутри!", smallDescription: "Он любил и страдал. Он любил деньги и страдал от их недостатка")

		let cellTwo = CellsModel(imageFirst: UIImage.assign.third.images, secondImage: UIImage.assign.fourth.images, headingNews: "Внимание! Внимание! Внимание! Говорит Германия! Сегодня под мостом...", textNews: "Подробности внутри!", smallDescription: "Поймали Гитлера с хвостом!")

		let cellThree = CellsModel(imageFirst: UIImage.assign.fifth.images, secondImage: UIImage.assign.sixth.images, headingNews: "Для того что б избавиться от...", textNews: "Вам нужно всего лишь один раз каждое утро...", smallDescription: "Если человек тебе сделал ЗЛО — ты дай ему конфетку, он тебе ЗЛО — ты ему конфетку... И так до тех пор, пока у этой твари не разовьётся сахарный диабет. Если женщина говорит мужчине, что он самый умный, значит, она понимает, что второго такого дурака она не найдет")

		let cellFour = CellsModel(imageFirst: UIImage.assign.seventh.images, secondImage: UIImage.assign.eighth.images, headingNews: "Лёд сбил самолёт с неба", textNews: "Эту бредовую новость я взял с инета", smallDescription: "Ипполит Матвеевич, почти плача, взбежал на пароход. Вот это ваш мальчик? – спросил завхоз подозрительно. Мальчик, сказал Остап, разве плох? Типичный мальчик. Кто скажет, что это девочка, пусть первый бросит в меня камень!")

		let cellFive = CellsModel(imageFirst: UIImage.assign.ninth.images, secondImage: UIImage.assign.tenth.images, headingNews: "Роскосмос запускает грузовик", textNews: "", smallDescription: "молодец что дооткрывал, тут просто текст для теста")
		
		return [cellOne, cellTwo, cellThree, cellFour, cellFive]
	}
}

extension UIImage {
	enum assign {
		case first, second, third, fourth, fifth, sixth, seventh, eighth, ninth, tenth
		var images: UIImage {
			switch self {
			case .first:
				return UIImage(named: "andrew")!
			case .second:
				return UIImage(named: "bence")!
			case .third:
				return UIImage(named: "casey")!
			case .fourth:
				return UIImage(named: "chuttersnap")!
			case .fifth:
				return UIImage(named: "david")!
			case .sixth:
				return UIImage(named: "eberhard")!
			case .seventh:
				return UIImage(named: "hussainh")!
			case .eighth:
				return UIImage(named: "ibrahimh")!
			case .ninth:
				return UIImage(named: "jos")!
			case .tenth:
				return UIImage(named: "leioash")!
			}
		}
	}
}
