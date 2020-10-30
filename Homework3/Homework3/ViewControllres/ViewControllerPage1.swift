//
//  ViewControllerPage1.swift
//  Homework3
//
//  Created by Uzver on 30.10.2020.
//

import UIKit

class ViewControllerPage1: UIViewController {

	@IBOutlet weak var labelOnTop: UILabel!
	@IBOutlet weak var labelBigSize: UILabel!
	@IBOutlet weak var labelThisTwoString: UILabel!

	@IBOutlet weak var circleButton: UIButton!
	@IBOutlet weak var roundingButton: UIButton!

	@IBOutlet weak var ourImage: UIImageView!

	@IBOutlet weak var activIndicator: UIActivityIndicatorView!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		buttonSettings()
    }



}


extension ViewControllerPage1 {
	func buttonSettings() {
		circleButton.layer.cornerRadius =
			circleButton.bounds.size.width/2
		circleButton.backgroundColor = .darkGray
		circleButton.layer.borderColor = UIColor.white.cgColor
		circleButton.layer.borderWidth = 1
		circleButton.setTitle("Circle", for: .normal)

		roundingButton.layer.cornerRadius = 8
		roundingButton.backgroundColor = .white
	}
}
