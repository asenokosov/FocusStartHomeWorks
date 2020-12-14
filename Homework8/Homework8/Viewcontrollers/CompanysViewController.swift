//
//  CompanysViewController.swift
//  Homework8
//
//  Created by Uzver on 14.12.2020.
//

import UIKit
import CoreData

class CompanysViewController: UIViewController {

	@IBOutlet weak var companysTableView: UITableView!

	var companys: [Company] = []

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	override func viewWillAppear(_ animated: Bool) {
		guard  let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
		let context = appDelegate.persistentContainer.viewContext
		let fetchRequest: NSFetchRequest<Company> = Company.fetchRequest()
		do {
			companys = try context.fetch(fetchRequest)
			companysTableView.reloadData()
		} catch let error as NSError {
			print(error.localizedDescription)
		}
	}

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		guard let destination = segue.destination as? DetailTableViewController, let selectedRow = self.companysTableView.indexPathForSelectedRow?.row else { return }
		destination.company = companys[selectedRow]
	}

	func deleteCompany(at indexpath: IndexPath) {
		let company = companys[indexpath.row]
		guard let context = company.managedObjectContext else { return }
		context.delete(company)
		do {
			try context.save()
			companys.remove(at: indexpath.row)
			companysTableView.deleteRows(at: [indexpath], with: .automatic)
		} catch {
			print("no")
			companysTableView.reloadRows(at: [indexpath], with: .automatic)
		}
	}
}

extension CompanysViewController: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return companys.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = companysTableView.dequeueReusableCell(withIdentifier: "companyCell", for: indexPath)
		let company = companys[indexPath.row]
		cell.textLabel?.text = company.name

		return cell
	}

	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			deleteCompany(at: indexPath)
		}
	}
}
