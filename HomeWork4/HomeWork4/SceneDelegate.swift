//
//  SceneDelegate.swift
//  HomeWork4
//
//  Created by Uzver on 05.11.2020.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?


	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		guard let _ = (scene as? UIWindowScene) else { return }

		guard  let splitViewController = window?.rootViewController as? UISplitViewController,
			   let leftNavigationController = splitViewController.viewControllers.first as? UINavigationController,
			   let masterViewController = leftNavigationController.viewControllers.first as? MainTableViewController,
			   let detailViewController = (splitViewController.viewControllers.last as? UINavigationController)?.topViewController as? DetailViewController else { fatalError()}

		detailViewController.navigationItem.leftItemsSupplementBackButton = true
		detailViewController.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
		masterViewController.delegate = detailViewController
		let firstNew = CellsModel.cellWithNews()
		detailViewController.cellObject = firstNew[0]

	}

	func sceneDidDisconnect(_ scene: UIScene) {
	}

	func sceneDidBecomeActive(_ scene: UIScene) {
	}

	func sceneWillResignActive(_ scene: UIScene) {
	}

	func sceneWillEnterForeground(_ scene: UIScene) {
	}

	func sceneDidEnterBackground(_ scene: UIScene) {
	}


}

