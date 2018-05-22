//
//  RepositoryListViewController.swift
//  coordinatorTestApp
//
//  Created by watanabe-yudai on 2018/05/18.
//  Copyright © 2018年 watanabe-yudai. All rights reserved.
//

import UIKit

class RepositoryListViewController: UIViewController {

    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.searchController = searchController

        let client = GitHubClient()
        let request = GitHubAPI.SearchRepositories(keyword: "swift")
        
        client.send(request: request){ result in
            switch result {
            case let .success(response):
                for item in response.items {
                    print(item)
                }
            case let .failure(error):
                print(error)
            }
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
