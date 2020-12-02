//
//  ViewController.swift
//  Homework-6
//
//  Created by Uzver on 01.12.2020.
//

import UIKit


let catNotificationKey = "iconsCat"
let forestNotificationKey = "iconsForest"
let cristmasNotificationKey = "iconsCristmas"

class MainViewController: UIViewController {
	
	@IBOutlet weak var imageMainView: UIImageView!
	@IBOutlet weak var showText: UILabel!
	@IBOutlet weak var actionButton: UIButton!
	@IBOutlet weak var hideText: UILabel!
	
	@IBAction func actionButtonTapped(_ sender: UIButton) {
	}
	
	let cat = Notification.Name(rawValue: catNotificationKey)
	let forest = Notification.Name(rawValue: forestNotificationKey)
	let cristmas = Notification.Name(rawValue: cristmasNotificationKey)
	
	deinit {
		NotificationCenter.default.removeObserver(self)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		buttonConfig()
		imageconfig()
		createObserver()
		showText.isHidden = true
	}
	
	func createObserver() {
		
		//Cat
		NotificationCenter.default.addObserver(self, selector: #selector(MainViewController.updateImage(notification:)), name: cat, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(MainViewController.updateNameLabel(notification:)), name: cat, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(MainViewController.updateBackground(notification:)), name: cat, object: nil)
		
		//Forest
		NotificationCenter.default.addObserver(self, selector: #selector(MainViewController.updateImage(notification:)), name: forest, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(MainViewController.updateNameLabel(notification:)), name: forest, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(MainViewController.updateBackground(notification:)), name: forest, object: nil)
		
		//Cristmas
		NotificationCenter.default.addObserver(self, selector: #selector(MainViewController.updateImage(notification:)), name: cristmas, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(MainViewController.updateNameLabel(notification:)), name: cristmas, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(MainViewController.updateBackground(notification:)), name: cristmas, object: nil)
	}
	
	@objc func updateImage(notification: NSNotification) {
		hideText.isHidden = true
		showText.isHidden = false
		if notification.name == cat {
			let image = UIImage(named: "cat")!
			imageMainView.image = image
			actionButton.backgroundColor = .darkGray
			actionButton.setTitleColor(.cyan, for: .normal)
		} else if notification.name == forest {
			let image = UIImage(named: "trees")!
			imageMainView.image = image
			actionButton.backgroundColor = .white
			actionButton.setTitleColor(.black, for: .normal)
		} else if notification.name == cristmas {
			let image = UIImage(named: "drink")!
			imageMainView.image = image
			actionButton.backgroundColor = .orange
			actionButton.setTitleColor(.blue, for: .normal)
		}
	}
	
	@objc func updateNameLabel(notification: NSNotification) {
		if notification.name == cat {
			let name = "Cat"
			showText.text = name
		} else if notification.name == forest {
			let name = "Forest"
			showText.text = name
		} else if notification.name == cristmas {
			let name = "drink"
			showText.text = name
		}
	}
	
	@objc func updateBackground(notification: NSNotification) {
		if notification.name == cat {
			let color = UIColor.cyan
			view.backgroundColor = color
		} else if notification.name == forest {
			let color = UIColor.gray
			view.backgroundColor = color
		} else if notification.name == cristmas {
			let color = UIColor(red: 1, green: 153/255, blue: 0, alpha: 1)
			view.backgroundColor = color
		}
	}
}

extension MainViewController {
	func buttonConfig() {
		actionButton.layer.borderWidth = 2
		actionButton.clipsToBounds = true
		actionButton.layer.cornerRadius = 8
		actionButton.backgroundColor = .black
		actionButton.setTitle("Жмякай же!", for: .normal)
		actionButton.setTitle("Ууууиииии!", for: .highlighted)
		actionButton.setTitleColor(.green, for: .normal)
		actionButton.setTitleColor(.yellow, for: .highlighted)
		
		UIView.animate(withDuration: 0.6, animations: {
			self.actionButton.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
		}, completion: {_ in
			UIView.animate(withDuration: 0.6) {
				self.actionButton.transform = CGAffineTransform.identity
			}
		})
	}
	
	func imageconfig() {
		imageMainView.layer.cornerRadius = 20
		imageMainView.clipsToBounds = true
	}
}
