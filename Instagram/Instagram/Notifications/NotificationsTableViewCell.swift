//
//  NotificationsTableViewCell.swift
//  Instagram
//
//  Created by Дмитрий Супрун on 20.10.22.
//

import UIKit

/// NotificationsTableViewCell
class NotificationsTableViewCell: UITableViewCell {
    // MARK: - IBOutlets
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var contentCellLabel: UILabel!
    @IBOutlet weak var followButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var postImageView: UIImageView!
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
