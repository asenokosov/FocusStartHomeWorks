//
//  MainSplitViewController.swift
//  HomeWork4
//
//  Created by Uzver on 07.11.2020.
//

import UIKit

class MainSplitViewController: UISplitViewController, UISplitViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
		self.delegate = self
		self.preferredDisplayMode = .oneBesideSecondary
    }

	func splitViewController(_ svc: UISplitViewController, topColumnForCollapsingToProposedTopColumn proposedTopColumn: UISplitViewController.Column) -> UISplitViewController.Column {
		return .primary
	}
}
