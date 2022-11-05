//
//  NotificationsTableViewCell.swift
//  Instagram
//
//  Created by Дмитрий Супрун on 20.10.22.
//

import UIKit

/// NotificationsTableViewCell
class NotificationsTableViewCell: UITableViewCell {
    // MARK: - Private Constants
    private enum Constants {
        static let cancelButtonConstraintID = "toCancelButtonConstraintID"
        static let followButtonConstraintID = "toFollowButtonConstraintID"
        static let superViewConstraintID = "toSuperViewConstraintID"
    }
    
    // MARK: - Private IBOutlets
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var contentCellLabel: UILabel!
    @IBOutlet private weak var followButton: UIButton!
    @IBOutlet private weak var cancelButton: UIButton!
    @IBOutlet private weak var postImageView: UIImageView!
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .black
    }
    
    // MARK: - Override Methods
    override func prepareForReuse() {
        super.prepareForReuse()
        avatarImageView.image = nil
        contentCellLabel.text = nil
        followButton.isHidden = false
        cancelButton.isHidden = false
        postImageView.image = nil
        contentView.constraints.forEach { constraint in
            switch constraint.identifier {
            case Constants.cancelButtonConstraintID,
                Constants.followButtonConstraintID:
                constraint.priority = UILayoutPriority.init(rawValue: 1000)
            case Constants.superViewConstraintID:
                constraint.priority = UILayoutPriority.init(rawValue: 751)
            default: break
            }
        }
    }
    
    // MARK: - Public Methods
    func configure(cellModel: NotificationsCellContent) {
        avatarImageView.image = UIImage(named: cellModel.avatarImageName)
        contentCellLabel.text = cellModel.contentLabelText
        followButton.isHidden = cellModel.isHiddenFollowButton
        cancelButton.isHidden = cellModel.isHiddenCancelButton
        
        if cellModel.isHiddenCancelButton {
            contentView.constraints.first(where: {
                $0.identifier == Constants.cancelButtonConstraintID })?.priority = UILayoutPriority.init(rawValue: 1)
        }
        if cellModel.isHiddenFollowButton {
            contentView.constraints.first(where: {
                $0.identifier == Constants.followButtonConstraintID })?.priority = UILayoutPriority.init(rawValue: 1)
        }
        
        if let image = cellModel.postImageName {
            postImageView.image = UIImage(named: image)
            contentView.constraints.first(where: {
                $0.identifier == Constants.superViewConstraintID })?.priority = UILayoutPriority.init(rawValue: 1)
        }
        layoutIfNeeded()
    }
}
