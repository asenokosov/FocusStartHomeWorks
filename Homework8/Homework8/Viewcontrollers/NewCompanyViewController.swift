//
//  NewCompanyViewController.swift
//  Homework8
//
//  Created by Uzver on 14.12.2020.
//

import UIKit

class NewCompanyViewController: UIViewController {

	@IBOutlet weak var titleTextField: UITextField!

	override func viewDidLoad() {
		super.viewDidLoad()
		titleTextField.delegate = self
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}

	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		titleTextField.resignFirstResponder()
	}

	@IBAction func saveCategory(_ sender: Any) {
		let company = Company(name: titleTextField.text ?? "")
		do {
			try company?.managedObjectContext?.save()
			self.navigationController?.popViewController(animated: true)
		} catch {
			print(error.localizedDescription)
		}
	}
}

extension NewCompanyViewController: UITextFieldDelegate {
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
}
