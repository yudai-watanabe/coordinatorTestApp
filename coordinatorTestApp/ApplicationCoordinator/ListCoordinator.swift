//
//  ListCoordinator.swift
//  coordinatorTestApp
//
//  Created by watanabe-yudai on 2018/05/17.
//  Copyright © 2018年 watanabe-yudai. All rights reserved.
//

import Foundation
import UIKit

class ListCoordinator: Coordinator {
	let presenter: UINavigationController
	
	private let listViewController: RepositoryListViewController

	init(presenter: UINavigationController) {
		self.presenter = presenter
		let storyboard: UIStoryboard =  UIStoryboard(name: "RepositoryListViewController", bundle: nil)
		let viewController = storyboard.instantiateViewController(withIdentifier: "RepositoryListViewController") as! RepositoryListViewController
		self.listViewController = viewController
		self.listViewController.title = "Repositorys"
	}
	
	func start() {
		presenter.pushViewController(listViewController, animated: false)
	}
	
}
