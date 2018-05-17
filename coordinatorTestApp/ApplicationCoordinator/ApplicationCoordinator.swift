//
//  ApplicationCoordinator.swift
//  coordinatorTestApp
//
//  Created by watanabe-yudai on 2018/05/17.
//  Copyright © 2018年 watanabe-yudai. All rights reserved.
//

import Foundation
import UIKit

class ApplicationCoordinator: Coordinator {
	let window: UIWindow
	let rootViewController: UITabBarController = UITabBarController()
	
	let listNavigationController = UINavigationController()
	let starNavigationController = UINavigationController()
	
	let listCoordinator: ListCoordinator
	
	init(window: UIWindow) {
		self.window = window
		let viewControllers = [listNavigationController]
		self.listCoordinator = ListCoordinator(presenter: listNavigationController)
		self.rootViewController.setViewControllers(viewControllers, animated: false)	
	}
	
	func start() {
		window.rootViewController = rootViewController
		window.makeKeyAndVisible()
	}
	
}




