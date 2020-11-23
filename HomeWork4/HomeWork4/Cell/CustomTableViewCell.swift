//
//  CustomTableViewCell.swift
//  HomeWork4
//
//  Created by Uzver on 06.11.2020.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
	@IBOutlet weak var headerCellOne: UILabel!
	@IBOutlet weak var textCellOne: UILabel!
	
	@IBOutlet weak var headre2: UILabel!
	@IBOutlet weak var label2: UILabel!
	
	@IBOutlet weak var header3: UILabel!
	@IBOutlet weak var label3: UILabel!
	
	@IBOutlet weak var headerCellFour: UILabel!
	@IBOutlet weak var labelCellFour: UILabel!
	
	@IBOutlet weak var headerCellFive: UILabel!
}

extension CustomTableViewCell: UITableViewController {
	func draw() {
		let cell = UITableView
	}
}
