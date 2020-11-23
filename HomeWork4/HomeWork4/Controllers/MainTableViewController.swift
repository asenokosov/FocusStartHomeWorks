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
		let cell = tableView.dequeueReusableCell(withIdentifier: "") as! CustomTableViewCell


		switch indexPath.row {

		case 0:
			let cellOne = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as! CustomTableViewCell
			cellOne.headerCellOne.text = currentNews.headingNews
			cellOne.textCellOne.text = currentNews.textNews
			return cellOne

		case 1:
			let cellTwo = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath) as! CustomTableViewCell
			cellTwo.headre2.text = currentNews.headingNews
			cellTwo.label2.text = currentNews.textNews
			return cellTwo

		case 2:
			let cellThree = tableView.dequeueReusableCell(withIdentifier: "Cell3", for: indexPath) as! CustomTableViewCell
			cellThree.header3.text = currentNews.headingNews
			cellThree.label3.text = currentNews.textNews
			return cellThree

		case 3:
			let cellFour = tableView.dequeueReusableCell(withIdentifier: "Cell4", for: indexPath) as! CustomTableViewCell
			cellFour.headerCellFour.text = currentNews.headingNews
			cellFour.labelCellFour.text = currentNews.textNews
			return cellFour
			
		case 4:
			let cellFive = tableView.dequeueReusableCell(withIdentifier: "Cell5", for: indexPath) as! CustomTableViewCell
			cellFive.headerCellFive.text = currentNews.headingNews
			return cellFive

		default:
			break
		}
		return cell
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let currentNews = news[indexPath.row]
		delegate?.newsObjectSelected(newsObject: currentNews)

		if let detailViewController = delegate as? DetailViewController, let detailNavigationController = detailViewController.navigationController {
			splitViewController?.showDetailViewController(detailNavigationController, sender: nil)
		}
	}
}
