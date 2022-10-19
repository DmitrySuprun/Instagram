//
//  MainFeedViewController.swift
//  Instagram
//
//  Created by Дмитрий Супрун on 17.10.22.
//

import UIKit

/// Main Feed. Present new posts, recommendation, story feed
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
//        posts = loadPostsFeed()
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

// MARK: - UITableViewDelegate
extension MainFeedViewController: UITableViewDelegate {
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

// MARK: - Service Layer
private extension MainFeedViewController {
    func loadPostsFeed() -> [Post] {
        let posts = [Post(userID: 1,
                          images: ["food01",
                                   "food02",
                                   "food03",
                                  ],
                          subTitleText: "",
                          isLiked: true,
                          isSavedToCollection: true,
                          likesCount: 122,
                          descriptionText: "",
                          postDate: Date(timeIntervalSince1970: 1665099000)),
                     Post(userID: 2,
                          images: ["food04",
                                   "food05",
                                   "food06",
                                  ],
                          subTitleText: "",
                          isLiked: false,
                          isSavedToCollection: true,
                          likesCount: 132,
                          descriptionText: "",
                          postDate: Date(timeIntervalSince1970: 1665089000)),
                     Post(userID: 3,
                          images: ["food07",
                                   "food08",
                                   "food09",
                                  ],
                          subTitleText: "",
                          isLiked: false,
                          isSavedToCollection: false,
                          likesCount: 37,
                          descriptionText: "",
                          postDate: Date(timeIntervalSince1970: 1665079000)),
                     Post(userID: 4,
                          images: ["food10",
                                   "food11",
                                   "food12",
                                  ],
                          subTitleText: "",
                          isLiked: false,
                          isSavedToCollection: false,
                          likesCount: 7340,
                          descriptionText: "",
                          postDate: Date(timeIntervalSince1970: 1665069000)),
        ]
        return posts
    }
    
    func loadUserInfo(userID: Int) -> User? {
        switch userID {
        case 1: return User(name: "Jaahi", id: 1, avatarImageName: "1")
        case 2: return User(name: "Nedras", id: 2, avatarImageName: "2")
        case 3: return User(name: "Mahtan", id: 3, avatarImageName: "3")
        case 4: return User(name: "Kleastera", id: 4, avatarImageName: "4")
        default: return nil
        }
    }
}
