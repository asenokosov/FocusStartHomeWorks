//
//  ViewControllerPage3.swift
//  Homework3
//
//  Created by Uzver on 04.11.2020.
//

import UIKit

class ViewControllerPage3: UIViewController {

	let borderWidth: CGFloat = 2.0
	let cornerRadius: CGFloat = 20
	let masksToBounds: Bool = true
	let ColorButtonBoreder: CGColor = UIColor.black.cgColor

	@IBOutlet weak var loginField: UITextField!
	@IBOutlet weak var passwordField: UITextField!
	@IBOutlet weak var enterButtonSettings: UIButton!

	@IBOutlet weak var enterButtonConstraint: NSLayoutConstraint!

	override func viewDidLoad() {
		super.viewDidLoad()
		settingEnterButton()
		CenterNotification()
	}
}


private extension ViewControllerPage3 {

	//MARK: Center Notification Observer

	func CenterNotification() {
		NotificationCenter.default.addObserver(self,
											   selector: #selector(updateTextView(notification:)),
											   name: UIResponder.keyboardWillChangeFrameNotification,
											   object: nil)
		NotificationCenter.default.addObserver(self,
											   selector: #selector(updateTextView(notification:)),
											   name: UIResponder.keyboardWillHideNotification,
											   object: nil)
	}

	//MARK: Keyboard Show/Hide

	@objc func keyboardWillShow(notification: NSNotification) {

		if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
			if view.frame.origin.y == 0 {
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

	// Скрывает клавиатуру по тапу за пределами текстовых полей
	internal override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		super.touchesBegan(touches, with: event)
		self.view.endEditing(true)
	}

	//MARK: Enter Button Behavior

	@objc func updateTextView(notification: Notification) {

		guard let userInfo = notification.userInfo as? [String: AnyObject],
			  let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
		else { return }

		if notification.name == UIResponder.keyboardWillHideNotification {
			UIView.animate(withDuration: 10, animations: { [self] () -> Void in
				self.enterButtonConstraint.constant = enterButtonConstraint.constant - keyboardFrame.size.height + 117
				self.view.layoutIfNeeded()
			})
		} else {
			UIView.animate(withDuration: 10, animations: { () -> Void in
				self.enterButtonConstraint.constant = keyboardFrame.size.height
				self.view.layoutIfNeeded()
			})
		}
	}

	//MARK: Settings button "ENTER"

	func settingEnterButton() {
		enterButtonSettings.layer.borderWidth = borderWidth
		enterButtonSettings.layer.borderColor = ColorButtonBoreder
		enterButtonSettings.layer.cornerRadius = cornerRadius
		enterButtonSettings.layer.masksToBounds = masksToBounds
	}
}
