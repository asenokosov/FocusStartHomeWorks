//
//  MainTableViewController.swift
//  HomeWork4
//
//  Created by Uzver on 06.11.2020.
//

import UIKit

protocol NewsObjectSelectedDelegate: class {
	func newsObjectSelected(newsObject: CellsModel)
}

class MainTableViewController: UITableViewController {

	var news = CellsModel.cellWithNews()

	weak var delegate: NewsObjectSelectedDelegate?

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	// MARK: - Table view data source

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return news.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let currentNews = news[indexPath.row]

		if indexPath.row == 0 {
			let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as! CustomTableViewCell1
			cell.headerCellOne.text = currentNews.headingNews
			cell.textCellOne.text = currentNews.textNews
			return cell
		} else if indexPath.row == 1 {
			let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath) as! CustomTableViewCell2
			cell.headre2.text = currentNews.headingNews
			cell.label2.text = currentNews.textNews
			return cell
		} else if indexPath.row == 2 {
			let cell = tableView.dequeueReusableCell(withIdentifier: "Cell3", for: indexPath) as! CustomTableViewCell3
			cell.header3.text = currentNews.headingNews
			cell.label3.text = currentNews.textNews
			return cell
		} else if indexPath.row == 3 {
			let cell = tableView.dequeueReusableCell(withIdentifier: "Cell4", for: indexPath) as! CustomTableViewCell4
			cell.headerCellFour.text = currentNews.headingNews
			cell.labelCellFour.text = currentNews.textNews
			return cell
		} else {
			let cell = tableView.dequeueReusableCell(withIdentifier: "Cell5", for: indexPath) as! CustomTableViewCell5
			cell.headerCellFive.text = currentNews.headingNews
			return cell
		}
	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let currentNews = news[indexPath.row]
		delegate?.newsObjectSelected(newsObject: currentNews)

		if let detailViewController = delegate as? DetailViewController, let detailNavigationController = detailViewController.navigationController {
			splitViewController?.showDetailViewController(detailNavigationController, sender: nil)
		}
	}
}
