//
//  AccountInfoViewController.swift
//  Instagram
//
//  Created by Дмитрий Супрун on 23.10.22.
//

import UIKit

/// Post, followers, following info
final class AccountInfoViewController: UIViewController {
    // MARK: - Constants
    enum Constants {
        static let headInfoCellID = "HeadInfoCellID"
        static let aboutCellID = "AboutCellID"
        static let postImagesCellID = "postImagesCellID"
        static let imageCellID = "imageCellID"
        static let iconCellID = "iconCellID"
        static let storiesTableViewCellID = "storiesTableViewCellID"
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - UITableViewDataSource
extension AccountInfoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.headInfoCellID)
            else { return UITableViewCell() }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.aboutCellID)
            else { return UITableViewCell() }
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.storiesTableViewCellID)
            else { return UITableViewCell() }
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.iconCellID)
            else { return UITableViewCell() }
            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.postImagesCellID)
            else { return UITableViewCell() }
            return cell
        default:
            return UITableViewCell()
        }
    }
}
