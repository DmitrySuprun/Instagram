//
//  NotificationsViewController.swift
//  Instagram
//
//  Created by Дмитрий Супрун on 20.10.22.
//

import UIKit

/// Show User Notifications separated by time
final class NotificationsViewController: UIViewController {
    // MARK: - Private Constants
    private enum Constants {
        static let applicationBlueColorName = "ApplicationBlue"
        static let footerLabelText = "See More Suggestions"
        static let notificationsTableViewCellID = "NotificationsTableViewCellID"
        static let emptyTextName = ""
        static let cancelButtonConstraintID = "toCancelButtonConstraintID"
        static let followButtonConstraintID = "toFollowButtonConstraintID"
        static let superViewConstraintID = "toSuperViewConstraintID"
    }
    
    // MARK: - Enum
    enum SectionsContentType: String {
        case today = "Today"
        case thisWeak = "This Weak"
        case thisMoth = "This Month"
        case earlier = "Earlier"
        case suggestedForYou = "Suggested For You"
    }
    
    // MARK: - Private Properties
    private var todayNotifications: [NotificationsCellContent] = []
    private var thisWeakNotifications: [NotificationsCellContent] = []
    private var thisMonthNotifications: [NotificationsCellContent] = []
    private var earlierNotifications: [NotificationsCellContent] = []
    private var suggestedForYouNotifications: [NotificationsCellContent] = []
    private lazy var contents = [
        todayNotifications,
        thisWeakNotifications,
        thisMonthNotifications,
        earlierNotifications,
        suggestedForYouNotifications
    ]
    
    private let notificationTypes: [SectionsContentType] = [
        .today,
        .thisWeak,
        .thisMoth,
        .earlier,
        .suggestedForYou
    ]
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
}

// MARK: - UITableViewDelegate
extension NotificationsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        20
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        let label = UILabel()
        if notificationTypes.indices.contains(section) {
            let type = notificationTypes[section]
            label.text = type.rawValue
        } else {
            label.text = Constants.emptyTextName
        }
        label.font = .boldSystemFont(ofSize: 16)
        label.frame = CGRect(x: 0, y: 0, width: 150, height: 25)
        view.addSubview(label)
        return view
    }
}

// MARK: - UITableViewDataSource
extension NotificationsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        notificationTypes.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if notificationTypes.indices.contains(section) {
            let type = notificationTypes[section]
            switch type {
            case .today: return todayNotifications.count
            case .thisWeak: return thisWeakNotifications.count
            case .thisMoth: return thisMonthNotifications.count
            case .earlier: return earlierNotifications.count
            case .suggestedForYou: return suggestedForYouNotifications.count
            }
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.notificationsTableViewCellID) as? NotificationsTableViewCell
        else { return UITableViewCell() }
        cell.configure(cellModel: contents[indexPath.section][indexPath.row])
        return cell
    }
}

// swiftlint:disable all
extension NotificationsViewController {
    private func loadData() {
        todayNotifications = [
            NotificationsCellContent(avatarImageName: "food01",
                                     contentLabelText: "Your contact Maxim is on Instagram as zankomaksim.",
                                     isHiddenFollowButton: false,
                                     isHiddenCancelButton: true)]
        
        thisWeakNotifications = [
            NotificationsCellContent(avatarImageName: "food02",
                                     contentLabelText: "Follow Caroline, Alex Rozko and others you know to see their photos and videos",
                                     isHiddenFollowButton: true,
                                     isHiddenCancelButton: true),
            NotificationsCellContent(avatarImageName: "food03",
                                     contentLabelText: "Follow Irina, Sofia and others you know to see their photos and videos",
                                     isHiddenFollowButton: false,
                                     isHiddenCancelButton: true)]
        
        thisMonthNotifications = [
            NotificationsCellContent(avatarImageName: "food04",
                                     contentLabelText: "Follow Caroline, Alex Rozko and others you know to see their photos and videos",
                                     isHiddenFollowButton: true,
                                     isHiddenCancelButton: true),
            NotificationsCellContent(avatarImageName: "food05",
                                     contentLabelText: "Follow Irina, Sofia and others you know to see their photos and videos....Follow Irina, Sofia and others you know to see their photos and videosFollow Irina, Sofia and others you know to see their photos and videosFollow Irina, Sofia and others you know to see their photos and videosFollow Irina, Sofia and others you know to see their photos and videosFollow Irina, Sofia and others you know to see their photos and videosFollow Irina, Sofia and others you know to see their photos and videos",
                                     isHiddenFollowButton: true,
                                     isHiddenCancelButton: true,
                                     postImageName: "food06"),
            NotificationsCellContent(avatarImageName: "food07",
                                     contentLabelText: "Follow Caroline, Alex Rozko and others you know to see their photos and videos",
                                     isHiddenFollowButton: true,
                                     isHiddenCancelButton: true),
            NotificationsCellContent(avatarImageName: "food08",
                                     contentLabelText: "Follow Irina, Sofia and others you know to see their photos and videos",
                                     isHiddenFollowButton: true,
                                     isHiddenCancelButton: true)]
        
        earlierNotifications = [
            NotificationsCellContent(avatarImageName: "food09",
                                     contentLabelText: "Follow Irina, Sofia and others you know to see their photos and videos....Follow Irina, Sofia and others you know to see their photos and videosFollow Irina, Sofia and others you know to see their photos and videosFollow Irina, Sofia and others you know to see their photos and videosFollow Irina, Sofia and others you know to see their photos and videosFollow Irina, Sofia and others you know to see their photos and",
                                     isHiddenFollowButton: true,
                                     isHiddenCancelButton: true,
                                     postImageName: "food10"),
            NotificationsCellContent(avatarImageName: "food11",
                                     contentLabelText: "Follow Irina, Sofia and others you know to see their photos and videos....Follow Irina",
                                     isHiddenFollowButton: false,
                                     isHiddenCancelButton: false),
            NotificationsCellContent(avatarImageName: "food12",
                                     contentLabelText: "Button",
                                     isHiddenFollowButton: false,
                                     isHiddenCancelButton: false)]
        
        suggestedForYouNotifications = [
            NotificationsCellContent(avatarImageName: "food13",
                                     contentLabelText: "Follow Irina, Sofia and others you know to see their photos and videos....Follow Irina, Sofia and others you know to see their photos and videosFollow Irina, Sofia and others you know to see their photos and videosFollow Irina, Sofia and others you know to see their photos and videosFollow Irina, Sofia and others you know to see their photos and videosFollow Irina, Sofia and others you know to see their photos and",
                                     isHiddenFollowButton: false,
                                     isHiddenCancelButton: false)]
    }
}
