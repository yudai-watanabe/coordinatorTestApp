//
//  RepositryTableViewCell.swift
//  coordinatorTestApp
//
//  Created by watanabe-yudai on 2018/05/23.
//

import UIKit

class RepositryTableViewCell: UITableViewCell {
    
    let id: String = "RepositryTableViewCell"

    @IBOutlet weak var repositoryName: UILabel!

    @IBOutlet weak var starCount: UILabel!
    
    var repository: Repository? {
        didSet {
            repositoryName.text = repository?.fullName
            starCount.text = repository?.stargazersCount.description
        }
    }
    
    
}
