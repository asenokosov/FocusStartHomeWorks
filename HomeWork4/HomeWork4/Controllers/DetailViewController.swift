//
//  DetailViewController.swift
//  HomeWork4
//
//  Created by Uzver on 06.11.2020.
//

import UIKit

class DetailViewController: UIViewController {

	@IBOutlet weak var labelDetailView: UILabel!
	@IBOutlet weak var imageOneDetailView: UIImageView!
	@IBOutlet weak var imageTwoDetailView: UIImageView!

	var cellObject: CellsModel? {
		didSet {
			set()
		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		}
	
	func set() {
		loadViewIfNeeded()
		imageShadowSettings()
		imageOneDetailView.image = cellObject?.imageFirst
		imageTwoDetailView.image = cellObject?.secondImage
		labelDetailView.text = cellObject?.smallDescription
		navigationItem.title = cellObject?.headingNews
	}
}


extension DetailViewController: NewsObjectSelectedDelegate {
	func newsObjectSelected(newsObject: CellsModel) {
		self.cellObject = newsObject
	}
}

extension DetailViewController {
	func imageShadowSettings() {
		imageOneDetailView.layer.cornerRadius = 8
	}
}
