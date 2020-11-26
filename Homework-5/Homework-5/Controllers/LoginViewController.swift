//
//  ViewController.swift
//  Homework-5
//
//  Created by Uzver on 17.11.2020.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

	let ref: DatabaseReference! = nil

	//MARK: IBOutlets

	@IBOutlet weak var scrollView: UIScrollView!
	@IBOutlet weak var alertLabel: UILabel!

	@IBOutlet weak var loginField: UITextField!
	@IBOutlet weak var passField: UITextField!

	@IBOutlet weak var loginButton: UIButton!
	@IBOutlet weak var passButton: UIButton!

	//MARK: View Did Load
	
	override func viewDidLoad() {
		super.viewDidLoad()
		alertLabel.isHidden = true
		customizeButton()

		let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

		view.addGestureRecognizer(tap)

		Auth.auth().addStateDidChangeListener({ [weak self] (auth, user) in
			if user != nil {
				self?.performSegue(withIdentifier: "tasksSegue", sender: nil)
			}
		})

		NotificationCenter.default.addObserver(self, selector: #selector(kbDidShow), name: UIResponder.keyboardDidShowNotification, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(kbDidHide), name: UIResponder.keyboardDidHideNotification, object: nil)
	}

	//MARK: Keyboard show/hide

	@objc func dismissKeyboard() {
		view.endEditing(true)
	}

	@objc func kbDidShow(notification: Notification) {
		guard let userInfo = notification.userInfo else { return }
		let kbFrameSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
		(self.view as! UIScrollView).contentSize = CGSize(width: self.view.bounds.size.width, height: self.view.bounds.size.height + kbFrameSize.height)
		(self.view as! UIScrollView).scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbFrameSize.height, right: 0)
	}

	@objc func kbDidHide() {
		(self.view as! UIScrollView).contentSize = CGSize(width: self.view.bounds.size.width, height: self.view.bounds.size.height)
	}


	//MARK: View Will Appear

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		loginField.text = ""
		passField.text = ""
	}

	//MARK: IBActions
	
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
			let userRef = self.ref.child((user?.user.uid)!)
			userRef.setValue(["email": user?.user.email])
		})
	}
}

extension LoginViewController {

	func displayWarning(text: String) {
		alertLabel.text = text
		UIView.animate(withDuration: 3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [.curveEaseInOut, .allowUserInteraction], animations: { [weak self] in
			self?.alertLabel.isHidden = false
		}) {[weak self] complete in self?.alertLabel.isHidden = true}
	}

	override var preferredStatusBarStyle: UIStatusBarStyle {
		return .lightContent
	}

	func customizeButton() {
		loginButton.layer.borderWidth = 2.0
		loginButton.layer.borderColor = UIColor.darkGray.cgColor
		loginButton.layer.cornerRadius = 10
		loginButton.layer.masksToBounds = true
	}
}
