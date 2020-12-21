//
//  ViewControllerPage1.swift
//  Homework3
//
//  Created by Uzver on 30.10.2020.
//

import UIKit

class ViewControllerPage1: UIViewController {
	
	private let cornerRadius: CGFloat = 8
	private let borderWidth: CGFloat = 1
	
	@IBOutlet weak var circleButton: UIButton!
	@IBOutlet weak var roundingButton: UIButton!
	
	@IBOutlet weak var activIndicator: UIActivityIndicatorView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		configureButtons()
		activIndicator.startAnimating()
	}
}


private extension ViewControllerPage1 {
	func configureButtons() {
		circleButton.layer.cornerRadius = circleButton.bounds.size.width / 2
		circleButton.backgroundColor = UIColor(named: "#5D151F")
		circleButton.layer.borderColor = UIColor.white.cgColor
		circleButton.layer.borderWidth = borderWidth
		circleButton.setTitle("Circle", for: .normal)
		
		roundingButton.layer.cornerRadius = cornerRadius
		roundingButton.backgroundColor = UIColor(named: "#5D151F")
		roundingButton.layer.borderColor = UIColor.white.cgColor
		roundingButton.layer.borderWidth = borderWidth
		roundingButton.setTitle("Round", for: .normal)
	}
}
