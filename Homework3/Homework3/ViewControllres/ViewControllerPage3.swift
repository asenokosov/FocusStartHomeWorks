//
//  ViewControllerPage3.swift
//  Homework3
//
//  Created by Uzver on 04.11.2020.
//

import UIKit

class ViewControllerPage3: UIViewController {

	private enum Constants {
		static let borderWidth: CGFloat = 2.0
		static let cornerRadius: CGFloat = 20
		static let duration: TimeInterval = 10
		static let keyboardHeight = 117
		static let masksToBounds = true
		static let colorButtonBoreder = UIColor.black.cgColor
	}

	@IBOutlet weak var loginField: UITextField!
	@IBOutlet weak var passwordField: UITextField!
	@IBOutlet weak var enterButtonSettings: UIButton!

	@IBOutlet weak var enterButtonConstraint: NSLayoutConstraint!

	override func viewDidLoad() {
		super.viewDidLoad()
		settingEnterButton()
		CenterNotification()
	}

	// Скрывает клавиатуру по тапу за пределами текстовых полей
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		super.touchesBegan(touches, with: event)
		self.view.endEditing(true)
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

	//MARK: Enter Button Behavior

	@objc func updateTextView(notification: Notification) {

		guard let userInfo = notification.userInfo as? [String: AnyObject],
			  let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
		else { return }

		if notification.name == UIResponder.keyboardWillHideNotification {
			UIView.animate(withDuration: Constants.duration) {
				self.enterButtonConstraint.constant = self.enterButtonConstraint.constant - keyboardFrame.size.height + CGFloat(Constants.keyboardHeight)
				self.view.layoutIfNeeded()
			}
		} else {
			UIView.animate(withDuration: Constants.duration) {
				self.enterButtonConstraint.constant = keyboardFrame.size.height
				self.view.layoutIfNeeded()
			}
		}
	}

	//MARK: Settings button "ENTER"

	func settingEnterButton() {

		enterButtonSettings.layer.borderWidth = Constants.borderWidth
		enterButtonSettings.layer.borderColor = Constants.colorButtonBoreder
		enterButtonSettings.layer.cornerRadius = Constants.cornerRadius
		enterButtonSettings.layer.masksToBounds = Constants.masksToBounds
	}
}
