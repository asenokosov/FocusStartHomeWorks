//
//  TasksViewController.swift
//  Homework-5
//
//  Created by Uzver on 17.11.2020.
//

import UIKit
import Firebase

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	var user: TaskAndUserModel.Users!
	var ref: DatabaseReference!
	var tasksAndUserModel = Array<TaskAndUserModel.Tasks>()
	
	@IBOutlet weak var tableView: UITableView!
	
	//MARK: View Did Load
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		guard let currentUser = Auth.auth().currentUser else { return }
		user = TaskAndUserModel.Users(user: currentUser)
		ref = Database.database().reference(withPath: "users").child(String(user.uid)).child("tasks")
	}
	
	//MARK: View Will Appear
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		ref.observe(.value, with: { [weak self] (snapshot) in
			var _tasks = Array<TaskAndUserModel.Tasks>()
			for item in snapshot.children {
				let task = TaskAndUserModel.Tasks.init(snapshot: item as! DataSnapshot)
				_tasks.append(task)
			}
			self?.tasksAndUserModel = _tasks
			self?.tableView.reloadData()
		})
	}
	
	//MARK: Table View
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return tasksAndUserModel.count
	}
	
	func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		return true
	}
	
	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			let task = tasksAndUserModel[indexPath.row]
			task.ref?.removeValue()
		}
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		guard let cell = tableView.cellForRow(at: indexPath) else { return }
		let task = tasksAndUserModel[indexPath.row]
		let complete = !task.completed
		toggleCompletion(cell, complete: complete)
		task.ref?.updateChildValues(["completed": complete])
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
		let taskTitle = tasksAndUserModel[indexPath.row]
		let task = tasksAndUserModel[indexPath.row]
		let complete = task.completed
		
		cell.textLabel?.text = taskTitle.title
		cell.backgroundColor = builder.setBackground
		cell.textLabel?.textColor = builder.setText
		toggleCompletion(cell, complete: complete)
		return cell
	}
	
	func toggleCompletion(_ cell: UITableViewCell, complete: Bool) {
		cell.accessoryType = complete ? .checkmark : .none
	}
	
	//MARK: IBActions
	
	@IBAction func addButton(_ sender: UIBarButtonItem) {
		let alert = UIAlertController(title: "Новая задача", message: "Добавьте новую задачу", preferredStyle: .alert)
		alert.addTextField( )
		let save = UIAlertAction(title: "Сохранить", style: .default) { [weak self] _ in
			guard let textField = alert.textFields?.first, textField.text != "" else { return }
			let task = TaskAndUserModel.Tasks(title: textField.text!, userID: (self?.user.uid)!)
			let taskRef = self?.ref.child(task.title.lowercased())
			taskRef?.setValue(["title": task.title, "userID": task.userID, "completed": task.completed])
		}
		let cancel = UIAlertAction(title: "Отмена", style: .default, handler: nil)
		
		alert.addAction(save)
		alert.addAction(cancel)
		present(alert, animated: true, completion: nil)
	}
	
	@IBAction func signOutButton(_ sender: UIBarButtonItem) {
		do {
			try Auth.auth().signOut()
		} catch {
			print(error.localizedDescription)
		}
		dismiss(animated: true, completion: nil)
	}
}
