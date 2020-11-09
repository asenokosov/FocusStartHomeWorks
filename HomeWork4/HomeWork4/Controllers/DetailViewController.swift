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

	@IBOutlet weak var viewImageOne: UIView!
	@IBOutlet weak var viewImageTwo: UIView!

	var cellObject: CellsModel? {
		didSet {
			set()
		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		setShadow()

	}

	func setShadow() {
		viewImageOne.shadowImage(cornerRadius: 10, shadowColor: .black, shadowRadius: 10)
		imageOneDetailView.shadowImage(cornerRadius: 10, shadowColor: .black, shadowRadius: 10)
		viewImageTwo.shadowImage(cornerRadius: 10, shadowColor: .black, shadowRadius: 10
		)
		imageTwoDetailView.shadowImage(cornerRadius: 10, shadowColor: .black, shadowRadius: 10)
	}

	func set() {
		loadViewIfNeeded()
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
extension UIView {
	func shadowImage(cornerRadius: CGFloat, shadowColor: UIColor, shadowOffset: CGSize = .zero, shadowOpacity: Float = 1, shadowRadius: CGFloat) {
		layer.cornerRadius = cornerRadius
		layer.shadowColor = shadowColor.cgColor
		layer.shadowOffset = shadowOffset
		layer.shadowOpacity = shadowOpacity
		layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
		layer.shadowRadius = shadowRadius
	}
}

