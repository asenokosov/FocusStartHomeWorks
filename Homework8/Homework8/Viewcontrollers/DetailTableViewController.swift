//
//  DetailTableViewController.swift
//  Homework8
//
//  Created by Uzver on 14.12.2020.
//

import UIKit
import CoreData

class DetailTableViewController: UIViewController {

	@IBOutlet weak var detailTableView: UITableView!

	var company: Company?
	var worker: [Worker] = []

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	override func viewWillAppear(_ animated: Bool) {
		guard  let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
		let context = appDelegate.persistentContainer.viewContext
		let fetchRequest: NSFetchRequest<Worker> = Worker.fetchRequest()
		do {
			worker = try context.fetch(fetchRequest)
			self.detailTableView.reloadData()
		} catch let error as NSError {
			print(error.localizedDescription)
		}
	}

	@IBAction func addNewExpense(_ sender: Any) {
		performSegue(withIdentifier: "saveMan", sender: self)
	}

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		guard let destination = segue.destination as? NewWorkerViewController else { return }
		destination.company = company
	}

	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			let man = worker[indexPath.row]
			guard let context = man.managedObjectContext else { return	}
			context.delete(man)
			do {
				try context.save()
				detailTableView.deleteRows(at: [indexPath], with: .automatic)
			} catch {
				print(error.localizedDescription)
				detailTableView.reloadRows(at: [indexPath], with: .automatic)
			}
		}
	}
}

extension DetailTableViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return company?.workers?.count ?? 0
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = detailTableView.dequeueReusableCell(withIdentifier: "workerCell", for: indexPath)
		if let worker = company?.workers?[indexPath.row] {
			cell.textLabel?.text = worker.name
		}
		return cell
	}
}

extension DetailTableViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		performSegue(withIdentifier: "saveMan", sender: self)
	}
}
