//
//  NewWorkerViewController.swift
//  Homework8
//
//  Created by Uzver on 14.12.2020.
//

import UIKit
import CoreData

class NewWorkerViewController: UIViewController {

	@IBOutlet weak var nameTextField: UITextField!
	@IBOutlet weak var ageTextField: UITextField!
	@IBOutlet weak var workExperienceTextField: UITextField!
	@IBOutlet weak var educationTextField: UITextField!
	@IBOutlet weak var postTextField: UITextField!
	@IBOutlet weak var saveButton: UIBarButtonItem!
	@IBOutlet weak var editButton: UIButton!

	var company: Company?
	var worker: Worker?

	override func viewDidLoad() {
		super.viewDidLoad()
		saveButton.isEnabled = false
		observTextField()
		nameTextField.delegate = self
		ageTextField.delegate = self
		workExperienceTextField.delegate = self
		educationTextField.delegate = self
		postTextField.delegate = self
	}

	private func observTextField() {
			nameTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
			ageTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
			workExperienceTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
		}

	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		nameTextField.resignFirstResponder()
		ageTextField.resignFirstResponder()
		workExperienceTextField.resignFirstResponder()
		educationTextField.resignFirstResponder()
		postTextField.resignFirstResponder()
	}

	@IBAction func saveExpense(_ sender: Any) {
		let name = nameTextField.text ?? ""
		let ageText = ageTextField.text ?? ""
		let expo = workExperienceTextField.text ?? ""
		let post = postTextField.text
		let education = educationTextField.text
		if let newGay = Worker(name: name, age: ageText, workExperience: expo, education: education, post: post) {
			company?.addToRawWorker(newGay)
			do {
				try newGay.managedObjectContext?.save()
				self.navigationController?.popViewController(animated: true)
			} catch {
				print(error.localizedDescription)
			}
		}
	}
}

extension NewWorkerViewController: UITextFieldDelegate {

	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}

	private func setupNavogationBar() {
		title = company?.name
		saveButton.isEnabled = true
	}

	@objc private func textFieldChanged() {
		if nameTextField.text?.isEmpty == true	||
			ageTextField.text?.isEmpty == true ||
			workExperienceTextField.text?.isEmpty == true {
			saveButton.isEnabled = false
		} else {
			saveButton.isEnabled = true
		}
	}
}
