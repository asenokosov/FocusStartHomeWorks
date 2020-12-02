//
//  SecondViewController.swift
//  Homework-6
//
//  Created by Uzver on 01.12.2020.
//

import UIKit

class SecondViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	@IBAction func catButton(_ sender: UIButton) {
		let name = Notification.Name(rawValue: catNotificationKey)
		NotificationCenter.default.post(name: name, object: nil)
		dismiss(animated: true, completion: nil)
	}

	@IBAction func cristmasButton(_ sender: UIButton) {
		let name = Notification.Name(rawValue: cristmasNotificationKey)
		NotificationCenter.default.post(name: name, object: nil)
		dismiss(animated: true, completion: nil)
	}

	@IBAction func forestButton(_ sender: UIButton) {
		let name = Notification.Name(rawValue: forestNotificationKey)
		NotificationCenter.default.post(name: name, object: nil)
		dismiss(animated: true, completion: nil)
	}
}
