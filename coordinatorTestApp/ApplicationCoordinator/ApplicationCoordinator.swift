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
	let loginNavigationController = UINavigationController()
	
	let listCoordinator: ListCoordinator
	let loginCoordinator: LoginCoordinator
	
	init(window: UIWindow) {
		self.window = window
		let viewControllers = [loginNavigationController, listNavigationController]
		self.rootViewController.setViewControllers(viewControllers, animated: false)
		self.listCoordinator = ListCoordinator(presenter: listNavigationController)
		self.loginCoordinator = LoginCoordinator(presenter: loginNavigationController)
	}
	
	func start() {
		window.rootViewController = rootViewController
		listCoordinator.start()
		loginCoordinator.start()
		window.makeKeyAndVisible()
	}
	
}




