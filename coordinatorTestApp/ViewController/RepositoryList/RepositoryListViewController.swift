//
//  RepositoryListViewController.swift
//  coordinatorTestApp
//
//  Created by watanabe-yudai on 2018/05/18.
//  Copyright © 2018年 watanabe-yudai. All rights reserved.
//

import UIKit
import Foundation
import SafariServices

class RepositoryListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let repositryTableViewCell = RepositryTableViewCell()
    
    var repostories: Array<Repository> = []

    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //self.navigationItem.searchController = searchController
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: repositryTableViewCell.id, bundle: nil),
                           forCellReuseIdentifier: repositryTableViewCell.id)

        let client = GitHubClient()
        let request = GitHubAPI.SearchRepositories()
        
        client.send(request: request){[weak self] result in
            switch result {
            case let .success(response):
                for item in response.items {
                    self?.repostories.append(item)
                }
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
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
    
}

extension RepositoryListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RepositryTableViewCell = tableView.dequeueReusableCell(withIdentifier: repositryTableViewCell.id , for: indexPath) as! RepositryTableViewCell
        cell.repository = repostories[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repostories.count
    }
    
}

extension RepositoryListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let url = repostories[indexPath.row].url
        let safariVC = SFSafariViewController(url: NSURL(string: url)! as URL)
        self.present(safariVC, animated: true, completion: nil)
    }
    
    
}

