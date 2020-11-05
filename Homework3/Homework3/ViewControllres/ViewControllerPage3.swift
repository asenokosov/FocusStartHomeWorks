//
//  ViewControllerPage3.swift
//  Homework3
//
//  Created by Uzver on 04.11.2020.
//

import UIKit

class ViewControllerPage3: UIViewController {

	@IBAction func enterButton(_ sender: Any) {
	}

	@IBOutlet weak var loginField: UITextField!
	@IBOutlet weak var passwordField: UITextField!
	@IBOutlet weak var enterButtonSettings: UIButton!

	@IBOutlet weak var enterButtonConstraint: NSLayoutConstraint!
	

	override func viewDidLoad() {
		super.viewDidLoad()
		settingEnterButton()
		NotificationCenter.default.addObserver(self,
											   selector: #selector(updateTextView(notification:)),
											   name: UIResponder.keyboardWillChangeFrameNotification,
											   object: nil)
		NotificationCenter.default.addObserver(self,
											   selector: #selector(updateTextView(notification:)),
											   name: UIResponder.keyboardWillHideNotification,
											   object: nil)

		//Решение со сдвигом по У
		//		NotificationCenter.default.addObserver(self, selector: #selector(ViewControllerPage3.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
		//		NotificationCenter.default.addObserver(self, selector: #selector(ViewControllerPage3.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
		//	}
	}

	// Скрывает клавиатуру по тапу за пределами текстовых полей
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		super.touchesBegan(touches, with: event)
		self.view.endEditing(true)
	}

	@objc func updateTextView(notification: Notification) {

		guard let userInfo = notification.userInfo as? [String: AnyObject],
			  let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
		else { return }

		if notification.name == UIResponder.keyboardWillHideNotification {
			UIView.animate(withDuration: 0.3, animations: { [self] () -> Void in
							self.enterButtonConstraint.constant = enterButtonConstraint.constant - keyboardFrame.size.height + 117})
			} else {
			UIView.animate(withDuration: 0.3, animations: { () -> Void in
				self.enterButtonConstraint.constant = keyboardFrame.size.height + 20
			})
		}
	}

	@objc func keyboardWillShow(notification: NSNotification) {

		if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
			if view.frame.origin.y == 0{
				let height = keyboardSize.height

				self.view.frame.origin.y += height
			}
		}
	}

	@objc func keyboardWillHide(notification: NSNotification) {
		if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
			if view.frame.origin.y != 0 {
				let height = keyboardSize.height
				self.view.frame.origin.y -= height
			}
		}
	}

	//Решение со двигом по У

	//	@objc func keyboardWillShow(notification: Notification) {
	//		guard let userInfo = notification.userInfo else { return }
	//		guard let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
	//		let keyboardFrame = keyboardSize.cgRectValue
	//		if self.view.frame.origin.y == 0 { self.view.frame.origin.y -= keyboardFrame.height}
	//	}

	//	@objc func keyboardWillHide(notification: Notification) {
	//
	//			guard let userInfo = notification.userInfo else { return }
	//			guard let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
	//			let keyboardFrame = keyboardSize.cgRectValue
	//			if self.view.frame.origin.y != 0 { self.view.frame.origin.y -= keyboardFrame.height}
	//	}
}


extension ViewControllerPage3 {
	func settingEnterButton() {
		enterButtonSettings.layer.borderWidth = 2.0
		enterButtonSettings.layer.borderColor = UIColor.black.cgColor
		enterButtonSettings.layer.cornerRadius = 20
		enterButtonSettings.layer.masksToBounds = true
	}
}
