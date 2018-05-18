//
//  LoginCoordinator.swift
//  coordinatorTestApp
//
//  Created by watanabe-yudai on 2018/05/17.
//  Copyright © 2018年 watanabe-yudai. All rights reserved.
//

import Foundation
import UIKit

class LoginCoordinator: Coordinator {
	let presenter: UINavigationController
	
	private let loginViewController: LoginViewController
	
	init(presenter: UINavigationController) {
		self.presenter = presenter
		let storyboard: UIStoryboard = UIStoryboard(name: "LoginViewController", bundle: nil)
		let viewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
		self.loginViewController = viewController
		self.loginViewController.title = "Login"
	}
	
	func start() {
		presenter.pushViewController(loginViewController, animated: false)
	}
	
	
}
