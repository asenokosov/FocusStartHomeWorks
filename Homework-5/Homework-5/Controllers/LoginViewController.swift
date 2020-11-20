//
//  ViewController.swift
//  Homework-5
//
//  Created by Uzver on 17.11.2020.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {


	@IBOutlet weak var alertLabel: UILabel!

	@IBOutlet weak var loginField: UITextField!
	@IBOutlet weak var passField: UITextField!

	@IBOutlet weak var loginButton: UIButton!
	@IBOutlet weak var passButton: UIButton!

	//let ref: DatabaseReference!

	override func viewDidLoad() {
		super.viewDidLoad()
		NotufucationObserver()
		alertLabel.isHidden = true

		Auth.auth().addStateDidChangeListener({ [weak self] (auth, user) in
			if user != nil {
				self?.performSegue(withIdentifier: "tasksSegue", sender: nil)
			}
		})
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)

		loginField.text = ""
		passField.text = ""
	}
	func displayWarning(text: String) {
		alertLabel.text = text
		UIView.animate(withDuration: 3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [.curveEaseInOut, .allowUserInteraction], animations: { [weak self] in
			self?.alertLabel.isHidden = false
		}) {[weak self] complete in self?.alertLabel.isHidden = true}
	}

	@IBAction func loginTapped(_ sender: Any) {
		guard let login = loginField.text, let password = passField.text, login != "", password != "" else {
			displayWarning(text: "Введите логин или пароль ещё раз")
			return
		}
		Auth.auth().signIn(withEmail: login, password: password, completion: {
			[weak self] (user, error) in
			guard error == nil, user != nil else {
				print(error!.localizedDescription)
				return
			}
			if user != nil {
				self?.performSegue(withIdentifier: "tasksSegue", sender: nil)
				return
			}
			self?.displayWarning(text: "Нет такого пользователя")
		})
	}

	@IBAction func registrationTapped(_ sender: Any) {
		guard let login = loginField.text, let password = passField.text, login != "", password != "" else {
			displayWarning(text: "Неверная информация")
			return
		}
		Auth.auth().createUser(withEmail: login, password: password, completion: {(user, error) in
			if error == nil {
				if user != nil {
				} else {
					print("Пользователь не создан")
				}
			} else {
				print(error?.localizedDescription ?? 0)
			}
//			let userRef = self.ref.child((user?.user.uid)!)
//			userRef.setValue(["email": user?.user.email])
		})
	}
}

extension LoginViewController {

	//MARK: Keyboard Observer and Show/Hide

	func NotufucationObserver() {
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow), name: UIResponder.keyboardDidShowNotification, object: nil)

		NotificationCenter.default.addObserver(self, selector: #selector(keyboardHide), name: UIResponder.keyboardDidHideNotification, object: nil)
	}

	@objc func keyboardShow(notification: Notification) {
		guard let userInfo = notification.userInfo else { return }
		let keyboardFrameSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
		(self.view as! UIScrollView).contentSize = CGSize(width: self.view.bounds.size.width, height: self.view.bounds.size.height + keyboardFrameSize.height)
		(self.view as! UIScrollView).scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrameSize.height, right: 0)
	}

	@objc func keyboardHide() {
		(self.view as! UIScrollView).contentSize = CGSize(width: self.view.bounds.size.width, height: self.view.bounds.size.height)
	}

	override var preferredStatusBarStyle: UIStatusBarStyle {
		return .lightContent
	}

}
