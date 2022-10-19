//
//  MainFeedViewController.swift
//  Instagram
//
//  Created by Дмитрий Супрун on 17.10.22.
//

import UIKit

/// Present new posts, recommendation, story feed
final class MainFeedViewController: UIViewController {
    // MARK: - Constants
    enum Constants {
        static let feedCellID = "FeedCell"
        static let suggestedYouCellID = "SuggestedYou"
        static let postCellID = "PostCell"
    }
    
    // MARK: - IBOutlets
    @IBOutlet weak var mainFeedTableView: UITableView!
    
    // MARK: - Private Properties
    private var posts: [Post] = []
    private var refreshTableControl = UIRefreshControl()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRefreshControl()
        addViews()
    }
    
    // MARK: - Objc Private Methods
    @objc private func handleRefreshTableAction() {
        refreshTableControl.endRefreshing()
    }
    
    // MARK: - Private Methods

    private func setupRefreshControl() {
        refreshTableControl.addTarget(self, action: #selector(handleRefreshTableAction), for: .valueChanged)
    }
    
    private func addViews() {
        mainFeedTableView.addSubview(refreshTableControl)
    }
}

// MARK: - UITableViewDataSource

extension MainFeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        switch indexPath.row {
        case 0: cell = tableView.dequeueReusableCell(withIdentifier: Constants.feedCellID, for: indexPath)
        case 3: cell = tableView.dequeueReusableCell(withIdentifier: Constants.suggestedYouCellID, for: indexPath)
        default: cell = tableView.dequeueReusableCell(withIdentifier: Constants.postCellID, for: indexPath)
        }
        return cell
    }
}
